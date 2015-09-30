//
//  TLMineViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/18.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLMineViewController.h"
#import "TLMineDetailViewController.h"
#import "TLExpressionViewController.h"
#import "TLSettingViewController.h"

#import "TLFounctionCell.h"
#import "TLUserDetailCell.h"
#import "TLUIHelper.h"

@interface TLMineViewController ()

@end

@implementation TLMineViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"我"];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 15.0f)];
    [self.tableView setTableHeaderView:view];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[TLFounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    [self.tableView registerClass:[TLUserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    
    [self initTestData];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self setHidesBottomBarWhenPushed:NO];
}

#pragma mark - UITableView

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data ? _data.count + 1 : 0;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    TLSettingGrounp *group = [_data objectAtIndex:section - 1];
    return group.itemsCount;
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
    if (indexPath.section == 0) {
        TLUserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell"];
        [cell setUser:_user];
        [cell setCellType:UserDetailCellTypeMine];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottomLineStyle:CellLineStyleFill];
        return cell;
    }
    
    TLSettingGrounp *group = [_data objectAtIndex:indexPath.section - 1];
    TLSettingItem *item = [group itemAtIndex: indexPath.row];
    
    TLFounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
    [cell setItem:item];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] :[cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return 90.0f;
    }

    return 43.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20.0f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id vc = nil;
    if (indexPath.section == 0 && indexPath.row == 0) {     // 个人信息
        vc = [[TLMineDetailViewController alloc] init];
    }
    else {
        TLSettingGrounp *group = [_data objectAtIndex:indexPath.section - 1];
        TLSettingItem *item = [group itemAtIndex: indexPath.row];
        if ([item.title isEqualToString:@"表情"]) {
            vc = [[TLExpressionViewController alloc] init];
        }
        else if ([item.title isEqualToString:@"设置"]) {
            vc = [[TLSettingViewController alloc] init];
        }
    }
    if (vc != nil) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - 初始化
- (void) initTestData
{
    _data = [TLUIHelper getMineVCItems];
    
    _user = [[TLUser alloc] init];
    _user.username = @"Bay、栢";
    _user.userID = @"li-bokun";
    _user.avatarURL = [NSURL URLWithString:@"0.jpg"];
    
    [self.tableView reloadData];
}

@end
