//
//  TLMineViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/18.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLMineViewController.h"
#import "TLFounctionCell.h"
#import "TLUserDetailCell.h"

@implementation TLMineViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"我"];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[TLFounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    [self.tableView registerClass:[TLUserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    
    [self initTestData];
}

#pragma mark - UITableView

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [_data objectAtIndex:section];
    return array.count;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FotterView"];
    if (view == nil) {
        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"FotterView"];
        [view setBackgroundView:[UIView new]];
    }
    return view;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [_data objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
 
    id cell = nil;
    if ([dic objectForKey:@"mine"] != nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell"];
        [cell setUser:_user];
        [cell setCellType:UserDetailCellTypeMine];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
        [cell setImageName:[dic objectForKey:@"image"]];
        [cell setTitle:[dic objectForKey:@"title"]];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setUserInteractionEnabled:YES];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    if (indexPath.row == 0) {
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottomLineStyle:CellLineStyleDefault];
    }
    if (indexPath.row == array.count - 1) {
        [cell setTopLineStyle:CellLineStyleNone];
        [cell setBottomLineStyle:CellLineStyleFill];
    }
    else {
        [cell setTopLineStyle:CellLineStyleNone];
        [cell setBottomLineStyle:CellLineStyleDefault];
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [_data objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];;
    if ([dic objectForKey:@"mine"] != nil) {
        return 90.0f;
    }
    else {
        return 43.0f;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 15.0f;
    }
    return 20.0f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - 初始化
- (void) initTestData
{
    NSDictionary *dic = @{@"mine" : @"YES"};
    NSDictionary *dic1 = @{@"title" : @"相册",
                           @"image" : @"MoreMyAlbum"};
    NSDictionary *dic2 = @{@"title" : @"收藏",
                           @"image" : @"MoreMyFavorites"};
    NSDictionary *dic3 = @{@"title" : @"钱包",
                           @"image" : @"MoreMyBankCard"};
    NSDictionary *dic4 = @{@"title" : @"卡包",
                           @"image" : @"MyCardPackageIcon"};
    NSDictionary *dic5 = @{@"title" : @"表情",
                           @"image" : @"MoreExpressionShops"};
    NSDictionary *dic6 = @{@"title" : @"设置",
                           @"image" : @"MoreSetting"};
    
    _data = [[NSMutableArray alloc] initWithObjects:@[], @[dic], @[dic1, dic2, dic3, dic4], @[dic5], @[dic6], nil];
    
    _user = [[TLUser alloc] init];
    _user.username = @"Bay、栢";
    _user.userID = @"li-bokun";
    _user.avatarURL = [NSURL URLWithString:@"3.png"];
    
    [self.tableView reloadData];
}

@end
