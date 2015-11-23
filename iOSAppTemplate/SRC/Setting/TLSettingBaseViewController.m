//
//  TLSettingBaseViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/11/22.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLSettingBaseViewController.h"
#import "TLSettingCell.h"
#import "TLSettingHeaderFooteFView.h"

@implementation TLSettingBaseViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[TLSettingCell class] forCellReuseIdentifier:@"TLSettingCell"];
    [self.tableView registerClass:[TLSettingHeaderFooteFView class] forHeaderFooterViewReuseIdentifier:@"TLSettingHeaderFooteFView"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 15.0f)];
    [self.tableView setTableHeaderView:view];
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TLSettingGrounp *group = [_data objectAtIndex:section];
    return group.itemsCount;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingGrounp *group = [_data objectAtIndex:indexPath.section];
    TLSettingItem *item = [group itemAtIndex:indexPath.row];
    TLSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLSettingCell"];
    [cell setItem:item];
    
    // cell分割线
    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TLSettingHeaderFooteFView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TLSettingHeaderFooteFView"];
    if (_data && _data.count > section) {
        TLSettingGrounp *group = [_data objectAtIndex:section];
        [view setText:group.headerTitle];
    }
    return view;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    TLSettingHeaderFooteFView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TLSettingHeaderFooteFView"];
    if (_data && _data.count > section) {
        TLSettingGrounp *group = [_data objectAtIndex:section];
        [view setText:group.footerTitle];
    }
    return view;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_data && _data.count > indexPath.section) {
        TLSettingGrounp *group = [_data objectAtIndex:indexPath.section];
        TLSettingItem *item = [group itemAtIndex:indexPath.row];
        return [TLSettingCell getHeightForText:item];
    }
    return 0.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_data && _data.count > section) {
        TLSettingGrounp *group = [_data objectAtIndex:section];
        if (group.headerTitle == nil) {
            return 0.0f;
        }
        return [TLSettingHeaderFooteFView getHeightForText:group.headerTitle];
    }
    return 0.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_data && _data.count > section) {
        TLSettingGrounp *group = [_data objectAtIndex:section];
        return [TLSettingHeaderFooteFView getHeightForText:group.footerTitle];
    }
    return 0.0f;
}


@end
