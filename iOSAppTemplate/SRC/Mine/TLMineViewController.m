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

#import "TLUserDetailCell.h"
#import "TLUserHelper.h"
#import "TLUIHelper.h"

@interface TLMineViewController ()

@end

@implementation TLMineViewController

#pragma mark - Life Cycle
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"我"];
    ;
    [self.tableView registerClass:[TLUserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    
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
    return self.data ? self.data.count + 1 : 0;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    TLSettingGrounp *group = [self.data objectAtIndex:section - 1];
    return group.itemsCount;
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
    
    return [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
         return [super tableView:tableView heightForFooterInSection:0];
    }
    return [super tableView:tableView heightForFooterInSection:section - 1];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id vc = nil;
    if (indexPath.section == 0 && indexPath.row == 0) {     // 个人信息
        vc = [[TLMineDetailViewController alloc] init];
    }
    else {
        TLSettingGrounp *group = [self.data objectAtIndex:indexPath.section - 1];
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
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Private Methods
- (void) initTestData
{
    self.data = [TLUIHelper getMineVCItems];
    
    _user = [TLUserHelper sharedUserHelper].user;
    
    [self.tableView reloadData];
}

@end
