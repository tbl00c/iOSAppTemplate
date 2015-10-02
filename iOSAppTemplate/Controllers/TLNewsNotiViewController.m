//
//  TLNewsNotiViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/9/30.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLNewsNotiViewController.h"

#import "TLFounctionCell.h"
#import "TLTableHeadFooterView.h"
#import "TLUIHelper.h"

@interface TLNewsNotiViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation TLNewsNotiViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"新消息通知"];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 10.0f)];
    [self.tableView setTableHeaderView:headView];
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 20.0f)];
    [self.tableView setTableFooterView:footerView];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[TLFounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    [self.tableView registerClass:[TLTableHeadFooterView class] forHeaderFooterViewReuseIdentifier:@"HeadFooterView"];
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
    TLSettingGrounp *group = [_data objectAtIndex:section];
    TLTableHeadFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeadFooterView"];
    [view setText:group.footerTitle];
    return view;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingGrounp *group = [_data objectAtIndex:indexPath.section];
    TLSettingItem *item = [group itemAtIndex: indexPath.row];
    
    TLFounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
    [cell setItem:item];
    (item.type == TLSettingItemTypeSwitch || ![item.title isEqualToString:@"接受新消息提醒"]) ? [cell setAccessoryType:UITableViewCellAccessoryNone] : [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
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
    TLSettingGrounp *group = [_data objectAtIndex:section];
    return [TLTableHeadFooterView heightForTextToFitView:group.footerTitle];
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8.0f;
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
    _data = [TLUIHelper getNewNotiVCItems];
    
    [self.tableView reloadData];
}

@end
