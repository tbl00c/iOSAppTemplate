//
//  TLMineViewController.h
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/18.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "CommonTableViewController.h"

@class TLUser;

@interface TLMineViewController : CommonTableViewController

@property (nonatomic, strong) TLUser *user;
@property (nonatomic, strong) NSMutableArray *data;

@end
