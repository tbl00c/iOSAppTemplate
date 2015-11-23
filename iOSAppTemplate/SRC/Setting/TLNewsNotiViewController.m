//
//  TLNewsNotiViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/9/30.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLNewsNotiViewController.h"
#import "TLUIHelper.h"


@implementation TLNewsNotiViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"新消息通知"];
    
    self.data = [TLUIHelper getNewNotiVCItems];
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    TLSettingGrounp *group = [_data objectAtIndex:indexPath.section];
//    TLSettingItem *item = [group itemAtIndex: indexPath.row];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
