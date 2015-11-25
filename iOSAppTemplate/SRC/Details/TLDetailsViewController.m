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
#import "TLUIHelper.h"

@interface TLDetailsViewController ()

@property (nonatomic, strong) TLDetailsSettingViewController *detailSettingVC;

@end

@implementation TLDetailsViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"详细资料"];
    [self.tableView registerClass:[TLUserDetailCell class] forCellReuseIdentifier:@"UserDetailCell"];
    [self initTestData];
  
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data ? self.data.count + 1 : 0;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    TLSettingGrounp *group = [self.data objectAtIndex:section - 1];
    return group.itemsCount;
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
    return [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return [super tableView:tableView heightForFooterInSection:0];
    }
    return [super tableView:tableView heightForFooterInSection:section - 1];
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }
    else {

    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Event Response
- (void) rightBarButtonDown
{
    [self.navigationController pushViewController:self.detailSettingVC animated:YES];
}

#pragma mark - Private Methods
- (void) initTestData
{
    self.data = [TLUIHelper getDetailVCItems];
    
    [self.tableView reloadData];
}

#pragma mark - Getter and Setter
- (TLDetailsSettingViewController *) detailSettingVC
{
    if (_detailSettingVC == nil) {
        _detailSettingVC = [[TLDetailsSettingViewController alloc] init];
    }
    return _detailSettingVC;
}

@end
