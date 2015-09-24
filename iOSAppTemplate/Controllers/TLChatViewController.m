//
//  TLChatViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLChatViewController.h"

@interface TLChatViewController ()

@end

@implementation TLChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void) setUser:(TLUser *)user
{
    _user = user;
    [self.navigationItem setTitle:user.username];
}


@end
