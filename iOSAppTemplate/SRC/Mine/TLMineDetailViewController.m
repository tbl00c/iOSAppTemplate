//
//  TLMineDetailViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/30.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLMineDetailViewController.h"
#import "TLUIHelper.h"

@implementation TLMineDetailViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"个人信息"];
    
    self.data = [TLUIHelper getMineDetailVCItems];
}

#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
