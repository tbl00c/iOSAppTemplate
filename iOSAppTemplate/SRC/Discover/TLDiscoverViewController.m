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

#import "TLUIHelper.h"

@interface TLDiscoverViewController ()

@property (nonatomic, strong) TLBottleViewController *bottleVC;
@property (nonatomic, strong) TLShoppingViewController *shoppingVC;
@property (nonatomic, strong) TLShakeViewController *shakeVC;

@end

@implementation TLDiscoverViewController

#pragma mark - LifeCycle
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"发现"];
    
    self.data = [TLUIHelper getDiscoverItems];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self setHidesBottomBarWhenPushed:NO];
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingGrounp *group = [self.data objectAtIndex:indexPath.section];
    TLSettingItem *item = [group itemAtIndex:indexPath.row];
    
    id vc;
    if ([item.title isEqualToString:@"摇一摇"]) {
        vc = self.shakeVC;
    }
    else if ([item.title isEqualToString:@"漂流瓶"]) {
        vc = self.bottleVC;
    }
    else if ([item.title isEqualToString:@"购物"]) {
        vc = self.shoppingVC;
    }
    
    if (vc != nil) {
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Getter and Setter
- (TLShakeViewController *) shakeVC
{
    if (_shakeVC == nil) {
        _shakeVC = [[TLShakeViewController alloc] init];
    }
    return _shakeVC;
}

- (TLBottleViewController *) bottleVC
{
    if (_bottleVC == nil) {
        _bottleVC = [[TLBottleViewController alloc] init];
    }
    return _bottleVC;
}

- (TLShoppingViewController *) shoppingVC
{
    if (_shoppingVC == nil) {
        _shoppingVC= [[TLShoppingViewController alloc] init];
    }
    return _shoppingVC;
}

@end
