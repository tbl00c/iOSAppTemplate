//
//  TLDetailsViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLDetailsViewController.h"
#import "TLUserDetailCell.h"
#import "TLDetailInfoCell.h"
#import "TLButtonCell.h"

@interface TLDetailsViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation TLDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"详细资料"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[TLUserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    [self.tableView registerClass:[TLDetailInfoCell class] forCellReuseIdentifier:@"DetailInfoCell"];
    [self.tableView registerClass:[TLButtonCell class] forCellReuseIdentifier:@"ButtonCell"];
    [self initTestData];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    if ([dic objectForKey:@"user"] != nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell"];
        [cell setUser:_user];
        [cell setCellType:UserDetailCellTypeFriends];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    else if ([dic objectForKey:@"button"] != nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ButtonCell"];
        [cell setButtonTitle:[dic objectForKey:@"title"]];
        if ([[dic objectForKey:@"title"] isEqualToString:@"发消息"]) {
            [cell setButtonBackgroundGColor:DEFAULT_GREEN_COLOR];
            [cell setButtonTitleColor:[UIColor whiteColor]];
        }
        return cell;
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"DetailInfoCell"];
        [(TLDetailInfoCell *)cell setCellType: ([dic objectForKey:@"founction"] == nil ? TLDetailInfoCellLeft : TLDetailInfoCellRight)];
        [cell setTitle:[dic objectForKey:@"title"]];
        [cell setSubTitle:[dic objectForKey:@"detail"]];
        [cell setImagesArray:[dic objectForKey:@"images"]];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setUserInteractionEnabled:YES];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
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
    NSArray *array = [_data objectAtIndex:indexPath.section];
    NSDictionary *dic = [array objectAtIndex:indexPath.row];;
    if (indexPath.row == _data.count - 1) {
        return 30.0f;
    }
    if ([dic objectForKey:@"user"] != nil) {
        return 90.0f;
    }
    else if ([dic objectForKey:@"detailAlbum"]) {
        return 86.0f;
    }
    else if ([dic objectForKey:@"button"]) {
        return 50.0f;
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
    NSDictionary *dic = @{@"user" : @"YES"};
    
    NSDictionary *dic1 = @{@"founction" : @"YES",
                           @"title" : @"设置备注和标签"};
    NSDictionary *dic2 = @{@"title" : @"电话号码",
                           @"detail" : @"18888888888"};
    
    NSDictionary *dic3 = @{@"title" : @"地区",
                           @"detail" : @"山东 青岛"};
    NSDictionary *dic4 = @{@"detailAlbum" : @"YES",
                           @"title" : @"个人相册",
                           @"images" : @[@"1.jpg", @"2.jpg", @"8.jpg"]};
    NSDictionary *dic5 = @{@"title" : @"更多"};
    NSDictionary *dic6 = @{@"button" : @"YES",
                           @"title" : @"发消息"};
    NSDictionary *dic7 = @{@"button" : @"YES",
                           @"title" : @"视频聊天"};
    
    _data = [[NSMutableArray alloc] initWithObjects:@[], @[dic], @[dic1, dic2], @[dic3, dic4, dic5], @[dic6, dic7], nil];
    
    [self.tableView reloadData];
}


@end
