//
//  TLDiscoverViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/17.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLDiscoverViewController.h"
#import "TLBottleViewController.h"
#import "TLShoppingViewController.h"
#import "TLShakeViewController.h"

#import "TLFounctionCell.h"
#import "TLUIHelper.h"

@interface TLDiscoverViewController ()

@property (nonatomic, strong) TLBottleViewController *bottleVC;
@property (nonatomic, strong) TLShoppingViewController *shoppingVC;
@property (nonatomic, strong) TLShakeViewController *shakeVC;

@end

@implementation TLDiscoverViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"发现"];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 15.0f)];
    [self.tableView setTableHeaderView:view];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[TLFounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    
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
    TLSettingItem *item = [group itemAtIndex:indexPath.row];
    
    TLFounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
    [cell setItem:item];
    [cell setUserInteractionEnabled:YES];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] :[cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20.0f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingGrounp *group = [_data objectAtIndex:indexPath.section];
    TLSettingItem *item = [group itemAtIndex:indexPath.row];
    
    id vc;
    if ([item.title isEqualToString:@"摇一摇"]) {
        if (_shakeVC == nil) {
            _shakeVC = [[TLShakeViewController alloc] init];
        }
        vc = _shakeVC;
    }
    else if ([item.title isEqualToString:@"漂流瓶"]) {
        if (_bottleVC == nil) {
            _bottleVC = [[TLBottleViewController alloc] init];
        }
        vc = _bottleVC;
    }
    else if ([item.title isEqualToString:@"购物"]) {
        if (_shoppingVC == nil) {
            _shoppingVC= [[TLShoppingViewController alloc] init];
        }
        vc = _shoppingVC;
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
    _data = [TLUIHelper getDiscoverItems];
    
    [self.tableView reloadData];
}

@end
