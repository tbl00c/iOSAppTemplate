//
//  TLDetailsSettingViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/9/30.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLDetailsSettingViewController.h"
#import "TLUIHelper.h"

@implementation TLDetailsSettingViewController

#pragma mark - LifeCycle
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"资料设置"];

    self.data = [TLUIHelper getDetailSettingVCItems];
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
