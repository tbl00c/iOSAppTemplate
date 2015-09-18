//
//  TLMineViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/18.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLMineViewController.h"
#import "TLFounctionCell.h"
#import "TLUserDetailCell.h"

@implementation TLMineViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"我"];
    [self.tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[TLFounctionCell class] forCellReuseIdentifier:@"FunctionCell"];
    [self.tableView registerClass:[TLUserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    
    [self initTestData];
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
 
    id cell = nil;
    if ([dic objectForKey:@"empty"] != nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
        [cell setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
        [cell setUserInteractionEnabled:NO];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setBottomLineStyle:CellLineStyleNone];
        [cell setTopLineStyle:CellLineStyleNone];
    }
    else if ([dic objectForKey:@"mine"] != nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell"];
        [cell setUser:_user];
        [cell setCellType:UserDetailCellTypeMine];
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setBottomLineStyle:CellLineStyleFill];
        [cell setTopLineStyle:CellLineStyleFill];
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
        [cell setImageName:[dic objectForKey:@"image"]];
        [cell setTitle:[dic objectForKey:@"title"]];
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
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [_data objectAtIndex:indexPath.row];;
    if (indexPath.row == 0) {
        return 15.0f;
    }
    if ([dic objectForKey:@"empty"] != nil) {
        return 20.0f;
    }
    else if ([dic objectForKey:@"mine"] != nil) {
        return 90.0f;
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
    NSDictionary *dic = @{@"mine" : @"YES"};
    NSDictionary *dic1 = @{@"title" : @"相册",
                           @"image" : @"MoreMyAlbum"};
    NSDictionary *dic2 = @{@"title" : @"收藏",
                           @"image" : @"MoreMyFavorites"};
    NSDictionary *dic3 = @{@"title" : @"钱包",
                           @"image" : @"MoreMyBankCard"};
    NSDictionary *dic4 = @{@"title" : @"卡包",
                           @"image" : @"MyCardPackageIcon"};
    NSDictionary *dic5 = @{@"title" : @"表情",
                           @"image" : @"MoreExpressionShops"};
    NSDictionary *dic6 = @{@"title" : @"设置",
                           @"image" : @"MoreSetting"};
    NSDictionary *empty = @{@"empty" : @"YES"};
    
    _data = [[NSMutableArray alloc] initWithObjects:empty, dic, empty, dic1, dic2, dic3, dic4, empty, dic5, empty, dic6, nil];
    
    _user = [[TLUser alloc] init];
    _user.username = @"Bay、栢";
    _user.userID = @"li-bokun";
    _user.avatarURL = [NSURL URLWithString:@"3.png"];
    
    [self.tableView reloadData];
}

@end
