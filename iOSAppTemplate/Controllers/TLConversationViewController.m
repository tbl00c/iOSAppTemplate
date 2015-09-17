//
//  TLConversationViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLConversationViewController.h"

#import "TLFriendSearchViewController.h"

#import "TLConversationCell.h"

@interface TLConversationViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) TLFriendSearchViewController *searchVC;
@property (nonatomic, strong) UIBarButtonItem *navRightButton;

@end

@implementation TLConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"消息"];
    [self setHidesBottomBarWhenPushed:NO];
    
    [self.tableView registerClass:[TLConversationCell class] forCellReuseIdentifier:@"ConversationCell"];
    
    [self initSubViews];
    
    _data = [self getTestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSMutableArray *) getTestData
{
    NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:20];
    
    TLConversation *item = [[TLConversation alloc] init];
    item.from = [NSString stringWithFormat:@"张三疯"];
    item.message = @"人生得意须尽欢，莫使金樽空对月!";
    item.avatarURL = [NSURL URLWithString:@"8.jpg"];
    item.messageCount = 0;
    item.date = [NSDate date];
    [models addObject:item];
    
    return models;
}

- (void) navRightButtonDown
{

}

#pragma mark - UITableView

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

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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

#pragma mark - UISearchBarDelegate

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.tabBarController.tabBar setHidden:YES];
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.tabBarController.tabBar setHidden:NO];
}

/**
 *  初始化子视图
 */
- (void) initSubViews
{
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    
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
    
    // navBar 右按钮
    _navRightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(navRightButtonDown)];
    [self.navigationItem setRightBarButtonItem:_navRightButton];
}

@end