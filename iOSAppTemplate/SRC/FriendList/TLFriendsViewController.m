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
#import "TLFriendHeaderView.h"

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

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"通讯录"];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:DEFAULT_NAVBAR_COLOR];
    
    // SubViews
    [self.tableView registerClass:[TLFriendCell class] forCellReuseIdentifier:@"FriendCell"];
    [self.tableView registerClass:[TLFriendHeaderView class] forHeaderFooterViewReuseIdentifier:@"WBFriendHeaderView"];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.tableView setTableFooterView:self.footerLabel];
    
    [self.navigationItem setRightBarButtonItem:self.addFriendButton];
    
    // 测试
    [self initTestData];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self setHidesBottomBarWhenPushed:NO];
}

#pragma mark - UITableViewDataSource
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
    TLFriendHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"WBFriendHeaderView"];
    [view setTitle:[self.section objectAtIndex:section]];
    return view;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    if (indexPath.section == 0) {
        TLSettingItem *item = [_functionGroup itemAtIndex:indexPath.row];
        TLUser *user = [[TLUser alloc] init];
        user.username = item.title;
        user.avatarURL = item.imageName;
        [cell setUser:user];
        [cell setTopLineStyle:CellLineStyleNone];
        indexPath.row == _functionGroup.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleNone] :[cell setBottomLineStyle:CellLineStyleDefault];
    }
    else {
        NSArray *array = [_data objectAtIndex:indexPath.section - 1];
        TLUser *user = [array objectAtIndex:indexPath.row];
        [cell setUser:user];
        [cell setTopLineStyle:CellLineStyleNone];
        
        if (indexPath.row == array.count - 1) {
            indexPath.section == _data.count ? [cell setBottomLineStyle:CellLineStyleFill] :[cell setBottomLineStyle:CellLineStyleNone];
        }
        else {
            [cell setBottomLineStyle:CellLineStyleDefault];
        }
    }
    
    return cell;
}

// 拼音首字母检索
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _section;
}

// 检索时空出搜索框
- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if(index == 0) {
        [self.tableView scrollRectToVisible:_searchController.searchBar.frame animated:NO];
        return -1;
    }
    return index;
}

#pragma mark - UITableViewDelegate
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
        NSArray *array = [_data objectAtIndex:indexPath.section - 1];
        self.detailsVC.user = [array objectAtIndex:indexPath.row];;
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:self.detailsVC animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
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

#pragma mark - Event Response
- (void) addFriendButtonDown
{
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:self.addFriendVC animated:YES];
}

#pragma mark - Private Methods
- (void) initTestData
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        _friendsArray = [[NSMutableArray alloc] initWithCapacity:3];
        TLUser *user1 = [[TLUser alloc] init];
        user1.username = @"吕轻侯";
        user1.nikename = @"侯哥";
        user1.userID = @"yun";
        user1.avatarURL = @"1.jpg";
        [_friendsArray addObject:user1];
        TLUser *user2 = [[TLUser alloc] init];
        user2.username = @"白展堂";
        user2.userID = @"小白2";
        user2.nikename = @"堂堂";
        user2.avatarURL = @"4.jpg";
        [_friendsArray addObject:user2];
        TLUser *user3 = [[TLUser alloc] init];
        user3.username = @"李秀莲";
        user3.userID = @"xiulian";
        user3.nikename = @"大嘴";
        user3.avatarURL = @"8.jpg";
        [_friendsArray addObject:user3];
        TLUser *user4 = [[TLUser alloc] init];
        user4.username = @"燕小六";
        user4.userID = @"xiao6";
        user4.avatarURL = @"11.jpg";
        [_friendsArray addObject:user4];
        TLUser *user5 = [[TLUser alloc] init];
        user5.username = @"郭芙蓉";
        user5.userID = @"furongMM";
        user5.avatarURL = @"12.jpg";
        [_friendsArray addObject:user5];
        TLUser *user6 = [[TLUser alloc] init];
        user6.username = @"佟湘玉";
        user6.userID = @"yu";
        user6.nikename = @"掌柜嗒";
        user6.avatarURL = @"7.jpg";
        [_friendsArray addObject:user6];
        TLUser *user7 = [[TLUser alloc] init];
        user7.username = @"莫小贝";
        user7.userID = @"XB";
        user7.nikename = @"小贝";
        user7.avatarURL = @"10.jpeg";
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

#pragma mark - Getter and Setter
- (UIBarButtonItem *) addFriendButton
{
    if (_addFriendButton == nil) {
        _addFriendButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contacts_add_friend"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriendButtonDown)];
    }
    return _addFriendButton;
}

- (TLFriendSearchViewController *) searchVC
{
    if (_searchVC == nil) {
        _searchVC = [[TLFriendSearchViewController alloc] init];
    }
    return _searchVC;
}

- (UISearchController *) searchController
{
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:self.searchVC];
        [_searchController setSearchResultsUpdater: self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController.searchBar setBarTintColor:DEFAULT_SEARCHBAR_COLOR];
        [_searchController.searchBar sizeToFit];
        [_searchController.searchBar setDelegate:self];
        [_searchController.searchBar.layer setBorderWidth:0.5f];
        [_searchController.searchBar.layer setBorderColor:WBColor(220, 220, 220, 1.0).CGColor];
    }
    return _searchController;
}

- (UILabel *) footerLabel
{
    if (_footerLabel == nil) {
        _footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 49.0f)];
        [_footerLabel setBackgroundColor:[UIColor whiteColor]];
        [_footerLabel setTextColor:[UIColor grayColor]];
        [_footerLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _footerLabel;
}

- (TLAddFriendViewController *) addFriendVC
{
    if (_addFriendVC == nil) {
        _addFriendVC = [[TLAddFriendViewController alloc] init];
    }
    return _addFriendVC;
}

- (TLDetailsViewController *) detailsVC
{
    if (_detailsVC == nil) {
        _detailsVC = [[TLDetailsViewController alloc] init];
    }
    return _detailsVC;
}

@end
