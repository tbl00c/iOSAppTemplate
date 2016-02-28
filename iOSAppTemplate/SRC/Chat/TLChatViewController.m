//
//  TLChatViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLChatViewController.h"
#import "TLChatMessageViewContrller.h"
#import "TLChatBoxViewController.h"
#import "TLUserHelper.h"
#import <MobClick.h>

@interface TLChatViewController () <TLChatMessageViewControllerDelegate, TLChatBoxViewControllerDelegate>
{
    CGFloat viewHeight;
}

@property (nonatomic, strong) TLChatMessageViewContrller *chatMessageVC;
@property (nonatomic, strong) TLChatBoxViewController *chatBoxVC;

@end

@implementation TLChatViewController

#pragma mark - LifeCycle
- (void) viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    [self setHidesBottomBarWhenPushed:YES];
    
    viewHeight = HEIGHT_SCREEN - HEIGHT_NAVBAR - HEIGHT_STATUSBAR;
    
    [self.view addSubview:self.chatMessageVC.view];
    [self addChildViewController:self.chatMessageVC];
    [self.view addSubview:self.chatBoxVC.view];
    [self addChildViewController:self.chatBoxVC];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [MobClick beginLogPageView:self.navigationItem.title];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:self.navigationItem.title];
}

#pragma mark - TLChatMessageViewControllerDelegate
- (void) didTapChatMessageView:(TLChatMessageViewContrller *)chatMessageViewController
{
    [self.chatBoxVC resignFirstResponder];
}

#pragma mark - TLChatBoxViewControllerDelegate
- (void) chatBoxViewController:(TLChatBoxViewController *)chatboxViewController sendMessage:(TLMessage *)message
{
    message.from = [TLUserHelper sharedUserHelper].user;
    [self.chatMessageVC addNewMessage:message];
    
    TLMessage *recMessage = [[TLMessage alloc] init];
    recMessage.messageType = message.messageType;
    recMessage.ownerTyper = TLMessageOwnerTypeOther;
    recMessage.date = [NSDate date];
    recMessage.text = message.text;
    recMessage.imagePath = message.imagePath;
    recMessage.from = message.from;
    [self.chatMessageVC addNewMessage:recMessage];
    
    [self.chatMessageVC scrollToBottom];
}

- (void) chatBoxViewController:(TLChatBoxViewController *)chatboxViewController didChangeChatBoxHeight:(CGFloat)height
{
    self.chatMessageVC.view.frameHeight = viewHeight - height;
    self.chatBoxVC.view.originY = self.chatMessageVC.view.originY + self.chatMessageVC.view.frameHeight;
    [self.chatMessageVC scrollToBottom];
}

#pragma mark - Getter and Setter
- (void) setUser:(TLUser *)user
{
    _user = user;
    [self.navigationItem setTitle:user.username];
}

- (TLChatMessageViewContrller *) chatMessageVC
{
    if (_chatMessageVC == nil) {
        _chatMessageVC = [[TLChatMessageViewContrller alloc] init];
        [_chatMessageVC.view setFrame:CGRectMake(0, HEIGHT_STATUSBAR + HEIGHT_NAVBAR, WIDTH_SCREEN, viewHeight - HEIGHT_TABBAR)];
        [_chatMessageVC setDelegate:self];
    }
    return _chatMessageVC;
}

- (TLChatBoxViewController *) chatBoxVC
{
    if (_chatBoxVC == nil) {
        _chatBoxVC = [[TLChatBoxViewController alloc] init];
        [_chatBoxVC.view setFrame:CGRectMake(0, HEIGHT_SCREEN - HEIGHT_TABBAR, WIDTH_SCREEN, HEIGHT_SCREEN)];
        [_chatBoxVC setDelegate:self];
    }
    return _chatBoxVC;
}

@end
