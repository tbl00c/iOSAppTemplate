//
//  TLDetailsViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLDetailsViewController.h"
#import "TLDetailsSettingViewController.h"

#import "TLUserDetailCell.h"
#import "TLFounctionCell.h"

#import "TLUIHelper.h"

@interface TLDetailsViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) TLDetailsSettingViewController *detailSettingVC;

@end

@implementation TLDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"详细资料"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 15.0f)];
    [self.tableView setTableHeaderView:view];
    [self.tableView registerClass:[TLUserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    [self.tableView registerClass:[TLFounctionCell class] forCellReuseIdentifier:@"DetailInfoCell"];
    [self initTestData];
  
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void) rightBarButtonDown
{
    if (_detailSettingVC == nil) {
        _detailSettingVC = [[TLDetailsSettingViewController alloc] init];
    }
    [self.navigationController pushViewController:_detailSettingVC animated:YES];
}

#pragma mark - UITableView

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data ? _data.count + 1 : 0;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    TLSettingGrounp *group = [_data objectAtIndex:section - 1];
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
    if (indexPath.section == 0) {
        TLUserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell"];
        [cell setUser:_user];
        [cell setCellType:UserDetailCellTypeFriends];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottomLineStyle:CellLineStyleFill];
        return cell;
    }
    TLSettingGrounp *group = [_data objectAtIndex:indexPath.section - 1];
    TLSettingItem *item = [group itemAtIndex:indexPath.row];

    TLFounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailInfoCell"];
    [cell setItem:item];
    if (item.type == TLSettingItemTypeButton) {
        if ([item.title isEqualToString:@"发消息"]) {
            [cell setButtonBackgroundGColor:DEFAULT_GREEN_COLOR];
            [cell setButtonTitleColor:[UIColor whiteColor]];
        }
        [cell setTopLineStyle:CellLineStyleNone];
        [cell setBottomLineStyle:CellLineStyleNone];
        return cell;
    }
    [cell setTitleFontSize:15.0f];
    [cell setSubTitleFontSize:15.0f];
    [cell setSubTitleFontColor:[UIColor blackColor]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] :[cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90.0f;
    }
    
    TLSettingGrounp *group = [_data objectAtIndex:indexPath.section - 1];
    TLSettingItem *item = [group itemAtIndex:indexPath.row];
    if (item.type == TLSettingItemTypeButton) {
        return 50.0f;
    }
    else if ([item.title isEqualToString:@"个人相册"]) {
        return 86.0f;
    }
    return 43.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20.0f;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }
    else {

    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - 初始化
- (void) initTestData
{
    _data = [TLUIHelper getDetailVCItems];
    
    [self.tableView reloadData];
}


@end
