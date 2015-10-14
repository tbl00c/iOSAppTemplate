//
//  TLChatViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLChatViewController.h"
#import "TLChatMessageViewContrller.h"
#import "TLInputBoxViewController.h"

@interface TLChatViewController ()

@property (nonatomic, strong) TLChatMessageViewContrller *chatVC;
@property (nonatomic, strong) TLInputBoxViewController *inputBoxVC;

@end

@implementation TLChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _chatVC = [[TLChatMessageViewContrller alloc] init];
    [_chatVC.view setFrame:CGRectMake(0, HEIGHT_STATUSBAR + HEIGHT_NAVBAR, WIDTH_SCREEN, HEIGHT_SCREEN - HEIGHT_TABBAR - HEIGHT_NAVBAR - HEIGHT_STATUSBAR)];
    [self.view addSubview:_chatVC.view];
    
    _inputBoxVC = [[TLInputBoxViewController alloc] init];
    [_inputBoxVC.view setFrame:CGRectMake(0, HEIGHT_SCREEN - HEIGHT_STATUSBAR, WIDTH_SCREEN, HEIGHT_SCREEN)];
    [self.view addSubview:_inputBoxVC.view];
}

- (void) setUser:(TLUser *)user
{
    _user = user;
    [self.navigationItem setTitle:user.username];
}


@end
