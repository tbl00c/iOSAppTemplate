//
//  TLFriendsViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLFriendsViewController.h"
#import "TLDataHelper.h"
#import "TLUIHelper.h"

#import "TLFriendSearchViewController.h"
#import "TLAddFriendViewController.h"
#import "TLDetailsViewController.h"

#import "TLFriendCell.h"

@interface TLFriendsViewController () <UISearchBarDelegate>

@property (nonatomic, strong) TLSettingGrounp *functionGroup;     // 功能列表

@property (nonatomic, strong) UIBarButtonItem *addFriendButton;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UILabel *footerLabel;

@property (nonatomic, strong) TLAddFriendViewController *addFriendVC;
@property (nonatomic, strong) TLFriendSearchViewController *searchVC;
@property (nonatomic, strong) TLDetailsViewController *detailsVC;

@end

@implementation TLFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"通讯录"];
    [self setHidesBottomBarWhenPushed:NO];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView registerClass:[TLFriendCell class] forCellReuseIdentifier:@"FriendCell"];
    
    [self initSubViews];
    [self initTestData];        // 测试
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self setHidesBottomBarWhenPushed:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) addFriendButtonDown
{
    if (_addFriendVC == nil) {
        _addFriendVC = [[TLAddFriendViewController alloc] init];
    }
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:_addFriendVC animated:YES];
}

#pragma mark - UITableView

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count + 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return _functionGroup.itemsCount;
    }
    NSArray *array = [_data objectAtIndex:section - 1];
    return array.count;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    
    id label = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    if (label == nil) {
        label = [[UILabel alloc] init];
        [label setFont:[UIFont systemFontOfSize:14.5f]];
        [label setTextColor:[UIColor grayColor]];
        [label setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    }
    [label setText:[NSString stringWithFormat:@"  %@", [_section objectAtIndex:section]]];
    return label;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    if (indexPath.section == 0) {
        TLSettingItem *item = [_functionGroup itemAtIndex:indexPath.row];
        TLUser *user = [[TLUser alloc] init];
        user.username = item.title;
        user.avatarURL = [NSURL URLWithString:item.imageName];
        [cell setUser:user];
        [cell setTopLineStyle:CellLineStyleNone];
        if (indexPath.row == _functionGroup.itemsCount - 1) {
            [cell setBottomLineStyle:CellLineStyleNone];
        }
        else {
            [cell setBottomLineStyle:CellLineStyleDefault];
        }
    }
    else {
        NSArray *array = [_data objectAtIndex:indexPath.section - 1];
        TLUser *user = [array objectAtIndex:indexPath.row];
        [cell setUser:user];
        [cell setTopLineStyle:CellLineStyleNone];
        
        if (indexPath.row == array.count - 1) {
            if (indexPath.section == _data.count) {
                [cell setBottomLineStyle:CellLineStyleFill];
            }
            else {
                [cell setBottomLineStyle:CellLineStyleNone];
            }
        }
        else {
            [cell setBottomLineStyle:CellLineStyleDefault];
        }
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54.5f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 22.0f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }
    else {
        if (_detailsVC == nil) {
            _detailsVC = [[TLDetailsViewController alloc] init];
        }
        NSArray *array = [_data objectAtIndex:indexPath.section - 1];
        _detailsVC.user = [array objectAtIndex:indexPath.row];;
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:_detailsVC animated:YES];
    }
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _section;
}

- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if(index == 0) {
        [self.tableView scrollRectToVisible:_searchController.searchBar.frame animated:NO];
        return -1;
    }
    else {
        return index - 1;
    }
}

#pragma mark - UISearchBarDelegate

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    _searchVC.friendsArray = self.friendsArray;
    [self.tabBarController.tabBar setHidden:YES];
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.tabBarController.tabBar setHidden:NO];
}

#pragma mark - 初始化
- (void) initSubViews
{
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:DEFAULT_NAVBAR_COLOR];
    
    // 添加好友按钮
    _addFriendButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contacts_add_friend"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriendButtonDown)];
    [self.navigationItem setRightBarButtonItem:_addFriendButton];
    
    // 搜索
    _searchVC = [[TLFriendSearchViewController alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_searchVC];
    [_searchController setSearchResultsUpdater: _searchVC];
    [_searchController.searchBar setPlaceholder:@"搜索"];
    [_searchController.searchBar setBarTintColor:DEFAULT_SEARCHBAR_COLOR];
    [_searchController.searchBar sizeToFit];
    [_searchController.searchBar setDelegate:self];
    [_searchController.searchBar.layer setBorderWidth:0.5f];
    [_searchController.searchBar.layer setBorderColor:[UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0].CGColor];
    [self.tableView setTableHeaderView:_searchController.searchBar];
    
    // 好友计数
    _footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 49.0f)];
    [_footerLabel setBackgroundColor:[UIColor whiteColor]];
    [_footerLabel setTextColor:[UIColor grayColor]];
    [_footerLabel setTextAlignment:NSTextAlignmentCenter];
    [self.tableView setTableFooterView:_footerLabel];
}

- (void) initTestData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        _friendsArray = [[NSMutableArray alloc] initWithCapacity:3];
        TLUser *user1 = [[TLUser alloc] init];
        user1.username = @"吕轻侯";
        user1.nikename = @"侯哥";
        user1.userID = @"yun";
        user1.avatarURL = [NSURL URLWithString:@"1.jpg"];
        [_friendsArray addObject:user1];
        TLUser *user2 = [[TLUser alloc] init];
        user2.username = @"白展堂";
        user2.userID = @"小白2";
        user2.nikename = @"堂堂";
        user2.avatarURL = [NSURL URLWithString:@"4.jpg"];
        [_friendsArray addObject:user2];
        TLUser *user3 = [[TLUser alloc] init];
        user3.username = @"李秀莲";
        user3.userID = @"xiulian";
        user3.nikename = @"大嘴";
        user3.avatarURL = [NSURL URLWithString:@"8.jpg"];
        [_friendsArray addObject:user3];
        TLUser *user4 = [[TLUser alloc] init];
        user4.username = @"燕小六";
        user4.userID = @"xiao6";
        user4.avatarURL = [NSURL URLWithString:@"11.jpg"];
        [_friendsArray addObject:user4];
        TLUser *user5 = [[TLUser alloc] init];
        user5.username = @"郭芙蓉";
        user5.userID = @"furongMM";
        user5.avatarURL = [NSURL URLWithString:@"12.jpg"];
        [_friendsArray addObject:user5];
        TLUser *user6 = [[TLUser alloc] init];
        user6.username = @"佟湘玉";
        user6.userID = @"yu";
        user6.nikename = @"掌柜嗒";
        user6.avatarURL = [NSURL URLWithString:@"7.jpg"];
        [_friendsArray addObject:user6];
        TLUser *user7 = [[TLUser alloc] init];
        user7.username = @"莫小贝";
        user7.userID = @"XB";
        user7.nikename = @"小贝";
        user7.avatarURL = [NSURL URLWithString:@"10.jpeg"];
        [_friendsArray addObject:user7];
        
        _functionGroup = [TLUIHelper getFriensListItemsGroup];
        
        _data = [TLDataHelper getFriendListDataBy:_friendsArray];
        _section = [TLDataHelper getFriendListSectionBy:_data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [_footerLabel setText:[NSString stringWithFormat:@"%lu位联系人", (unsigned long)_friendsArray.count]];
        });
    });
}

@end
