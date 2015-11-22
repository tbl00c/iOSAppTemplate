//
//  TLConversationViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLConversationViewController.h"

#import "TLFriendSearchViewController.h"
#import "TLChatViewController.h"

#import "TLConversationCell.h"

@interface TLConversationViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) TLFriendSearchViewController *searchVC;
@property (nonatomic, strong) TLChatViewController *chatVC;
@property (nonatomic, strong) UIBarButtonItem *navRightButton;

@end

@implementation TLConversationViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"消息"];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    
    // subView
    [self.navigationItem setRightBarButtonItem:self.navRightButton];        // nav菜单
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.tableView registerClass:[TLConversationCell class] forCellReuseIdentifier:@"ConversationCell"];
    
    // data
    _data = [self getTestData];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLConversationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConversationCell"];
    [cell setConversation:_data[indexPath.row]];
    [cell setTopLineStyle:CellLineStyleNone];
    if (indexPath.row == _data.count - 1) {
        [cell setBottomLineStyle:CellLineStyleFill];
    }
    else {
        [cell setBottomLineStyle:CellLineStyleDefault];
    }
    return cell;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_data removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_chatVC == nil) {
        _chatVC = [[TLChatViewController alloc] init];
    }
    TLUser *user7 = [[TLUser alloc] init];
    user7.username = @"莫小贝";
    user7.userID = @"XB";
    user7.nikename = @"小贝";
    user7.avatarURL = @"10.jpeg";
    _chatVC.user = user7;
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:_chatVC animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Event Response
- (void) navRightButtonDown
{
    
}

#pragma mark - Private Methods
- (NSMutableArray *) getTestData
{
    NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:20];
    
    TLConversation *item1 = [[TLConversation alloc] init];
    item1.from = [NSString stringWithFormat:@"莫小贝"];
    item1.message = @"帅哥你好！！";
    item1.avatarURL = [NSURL URLWithString:@"10.jpeg"];
    item1.messageCount = 0;
    item1.date = [NSDate date];
    [models addObject:item1];
    
    return models;
}

#pragma mark - UISearchBarDelegate

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.tabBarController.tabBar setHidden:YES];
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.tabBarController.tabBar setHidden:NO];
}


#pragma mark - Getter and Setter
- (UIBarButtonItem *) navRightButton
{
    if (_navRightButton == nil) {
        _navRightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(navRightButtonDown)];
    }
    return _navRightButton;
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
        _searchController = [[UISearchController alloc] initWithSearchResultsController:_searchVC];
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

@end