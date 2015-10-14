//
//  TLSettingViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/30.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLSettingViewController.h"
#import "TLNewsNotiViewController.h"

#import "TLFounctionCell.h"
#import "TLUIHelper.h"

@interface TLSettingViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation TLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"设置"];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 15.0f)];
    [self.tableView setTableHeaderView:view];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[TLFounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    
    [self initTestData];
}

#pragma mark - UITableView
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TLSettingGrounp *group = [_data objectAtIndex:section];
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
    TLSettingGrounp *group = [_data objectAtIndex:indexPath.section];
    TLSettingItem *item = [group itemAtIndex: indexPath.row];
    
    TLFounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
    [cell setItem:item];
    item.type == TLSettingItemTypeMidTitle ? [cell setAccessoryType:UITableViewCellAccessoryNone] : [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20.0f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingGrounp *group = [_data objectAtIndex:indexPath.section];
    TLSettingItem *item = [group itemAtIndex: indexPath.row];
    if ([item.title isEqualToString:@"新消息通知"]) {
        TLNewsNotiViewController *newsNotiVC = [[TLNewsNotiViewController alloc] init];
        [self.navigationController pushViewController:newsNotiVC animated:YES];
    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - 初始化
- (void) initTestData
{
    _data = [TLUIHelper getSettingVCItems];
    
    [self.tableView reloadData];
}

@end
