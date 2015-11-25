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
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)]];

    [self.tableView registerClass:[TLSettingCell class] forCellReuseIdentifier:@"TLSettingCell"];
    [self.tableView registerClass:[TLSettingHeaderFooteFView class] forHeaderFooterViewReuseIdentifier:@"TLSettingHeaderFooteFView"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
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
    if (item.type != TLSettingItemTypeButton) {
        indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] : [cell setTopLineStyle:CellLineStyleNone];
        indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    }
    else {
        [cell setTopLineStyle:CellLineStyleNone];
        [cell setBottomLineStyle:CellLineStyleNone];
    }
    
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
            return section == 0 ? 15.0f : 10.0f;
        }
        return [TLSettingHeaderFooteFView getHeightForText:group.headerTitle];
    }
    return 10.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_data && _data.count > section) {
        TLSettingGrounp *group = [_data objectAtIndex:section];
        if (group.footerTitle == nil) {
            return section == _data.count - 1 ? 30.0f : 10.0f;
        }
        return [TLSettingHeaderFooteFView getHeightForText:group.footerTitle];
    }
    return 10.0f;
}


@end
