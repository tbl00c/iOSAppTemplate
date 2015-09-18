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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"EmptyCell"];
    [self.tableView registerClass:[TLUserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    [self.tableView registerClass:[TLDetailInfoCell class] forCellReuseIdentifier:@"DetailInfoCell"];
    [self.tableView registerClass:[TLButtonCell class] forCellReuseIdentifier:@"ButtonCell"];
    [self initTestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UITableView

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [_data objectAtIndex:indexPath.row];
    
    if ([dic objectForKey:@"empty"] != nil) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmptyCell"];
        [cell setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
        [cell setUserInteractionEnabled:NO];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        return cell;
    }
    else if ([dic objectForKey:@"user"] != nil) {
        TLUserDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell"];
        [cell setUser:_user];
        [cell setCellType:UserDetailCellTypeFriends];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setBottomLineStyle:CellLineStyleFill];
        [cell setTopLineStyle:CellLineStyleFill];
        return cell;
    }
    else if ([dic objectForKey:@"button"] != nil) {
        TLButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ButtonCell"];
        [cell setButtonTitle:[dic objectForKey:@"title"]];
        if ([[dic objectForKey:@"title"] isEqualToString:@"发消息"]) {
            [cell setButtonBackgroundGColor:DEFAULT_GREEN_COLOR];
            [cell setButtonTitleColor:[UIColor whiteColor]];
        }
        return cell;
    }
    else {
        TLDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailInfoCell"];
        [cell setCellType: ([dic objectForKey:@"founction"] == nil ? TLDetailInfoCellLeft : TLDetailInfoCellRight)];
        [cell setTitle:[dic objectForKey:@"title"]];
        [cell setSubTitle:[dic objectForKey:@"detail"]];
        [cell setImagesArray:[dic objectForKey:@"images"]];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setUserInteractionEnabled:YES];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        if (indexPath.row > 0) {
            NSDictionary *preDic = [_data objectAtIndex:indexPath.row - 1];
            if ([preDic objectForKey:@"empty"] != nil) {
                [cell setTopLineStyle:CellLineStyleFill];
            }
            else {
                [cell setTopLineStyle:CellLineStyleNone];
            }
        }
        if (indexPath.row == _data.count - 1) {
            [cell setBottomLineStyle:CellLineStyleFill];
        }
        else {
            NSDictionary *nextDic = [_data objectAtIndex:indexPath.row + 1];
            if ([nextDic objectForKey:@"empty"] != nil) {
                [cell setBottomLineStyle:CellLineStyleFill];
            }
            else {
                [cell setBottomLineStyle:CellLineStyleDefault];
            }
        }
        return cell;
    }
    
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [_data objectAtIndex:indexPath.row];;
    if (indexPath.row == 0) {
        return 15.0f;
    }
    else if (indexPath.row == _data.count - 1) {
        return 30.0f;
    }
    if ([dic objectForKey:@"empty"] != nil) {
        return 20.0f;
    }
    else if ([dic objectForKey:@"user"] != nil) {
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
    NSDictionary *empty = @{@"empty" : @"YES"};
    
    _data = [[NSMutableArray alloc] initWithObjects:empty, dic, empty, dic1, dic2,  empty, dic3, dic4, dic5, empty, dic6, dic7, empty, nil];
    
    _user = [[TLUser alloc] init];
    _user.username = @"张三疯";
    _user.userID = @"zsf001";
    _user.nikename = @"你是三疯吗";
    _user.avatarURL = [NSURL URLWithString:@"3.png"];
    
    [self.tableView reloadData];
}


@end
