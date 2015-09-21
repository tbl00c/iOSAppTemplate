//
//  TLDiscoverViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/17.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLDiscoverViewController.h"
#import "TLWebViewController.h"

#import "TLFounctionCell.h"

@interface TLDiscoverViewController ()

@property (nonatomic, strong) TLWebViewController *webVC;

@end

@implementation TLDiscoverViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"发现"];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[TLFounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    
    [self initTestData];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
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
    TLFounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
    NSArray *array = [_data objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    [cell setImageName:[dic objectForKey:@"image"]];
    [cell setTitle:[dic objectForKey:@"title"]];
    [cell setBackgroundColor:[UIColor whiteColor]];
    [cell setUserInteractionEnabled:YES];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    if (indexPath.row == 0) {
        [cell setTopLineStyle:CellLineStyleFill];
    }
    else {
        [cell setTopLineStyle:CellLineStyleNone];
    }
    if (indexPath.row == array.count - 1) {
        [cell setBottomLineStyle:CellLineStyleFill];
    }
    else {
        [cell setBottomLineStyle:CellLineStyleDefault];
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
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
    NSArray *array = [_data objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];
    NSString *title = [dic objectForKey:@"title"];
    
    [self setHidesBottomBarWhenPushed:YES];
    if ([title isEqualToString:@"购物"]) {
        [self.webVC setUrlString:@"http://wq.jd.com"];
        [self.navigationController pushViewController:self.webVC animated:YES];
    }
    [self setHidesBottomBarWhenPushed:NO];

    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (TLWebViewController *) webVC
{
    if (_webVC == nil) {
        _webVC = [[TLWebViewController alloc] init];
    }
    return _webVC;
}

#pragma mark - 初始化
- (void) initTestData
{
    NSDictionary *dic = @{@"title" : @"朋友圈",
                          @"image" : @"ff_IconShowAlbum"};
    NSDictionary *dic1 = @{@"title" : @"扫一扫",
                          @"image" : @"ff_IconQRCode"};
    NSDictionary *dic2 = @{@"title" : @"摇一摇",
                           @"image" : @"ff_IconShake"};
    NSDictionary *dic3 = @{@"title" : @"附近的人",
                           @"image" : @"ff_IconLocationService"};
    NSDictionary *dic4 = @{@"title" : @"漂流瓶",
                           @"image" : @"ff_IconBottle"};
    NSDictionary *dic5 = @{@"title" : @"购物",
                          @"image" : @"CreditCard_ShoppingBag"};
    NSDictionary *dic6 = @{@"title" : @"游戏",
                           @"image" : @"MoreGame"};
    _data = [[NSMutableArray alloc] initWithObjects:@[], @[dic], @[dic1, dic2], @[dic3, dic4], @[dic5, dic6], nil];
    
    [self.tableView reloadData];
}

@end
