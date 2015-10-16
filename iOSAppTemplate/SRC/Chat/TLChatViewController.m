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

@interface TLChatViewController () <TLChatBoxViewControllerDelegate>
{
    CGFloat viewHeight;
}

@property (nonatomic, strong) TLChatMessageViewContrller *chatMessageVC;
@property (nonatomic, strong) TLChatBoxViewController *chatBoxVC;

@end

@implementation TLChatViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    viewHeight = HEIGHT_SCREEN - HEIGHT_NAVBAR - HEIGHT_STATUSBAR;
    
    [self.view addSubview:self.chatMessageVC.view];
    [self addChildViewController:self.chatMessageVC];
    [self.view addSubview:self.chatBoxVC.view];
    [self addChildViewController:self.chatBoxVC];
    [self loadTestData];
}

#pragma mark - TLChatBoxViewControllerDelegate
- (void) chatBoxViewController:(TLChatBoxViewController *)chatboxViewController didChangeChatBoxHeight:(CGFloat)height
{
    self.chatMessageVC.view.frameHeight = viewHeight - height;
    self.chatBoxVC.view.originY = self.chatMessageVC.view.originY + self.chatMessageVC.view.frameHeight;
    [self.chatMessageVC scrollToBottom];
}

#pragma mark - Private Method
- (void) loadTestData
{
    TLMessage *message = [[TLMessage alloc] init];
    message.from = _user;
    message.messageType = TLMessageTypeText;
    message.ownerTyper = TLMessageOwnerTypeOther;
    message.date = [NSDate date];
    message.text = @"hello world!";
    [_chatMessageVC addNewMessage:message];
    
    TLMessage *message1 = [[TLMessage alloc] init];
    message1.from = _user;
    message1.messageType = TLMessageTypeText;
    message1.ownerTyper = TLMessageOwnerTypeSelf;
    message1.date = [NSDate date];
    message1.text = @"不要和我比懒，我懒得和你比!";
    [_chatMessageVC addNewMessage:message1];
    
    TLMessage *message2 = [[TLMessage alloc] init];
    message2.from = _user;
    message2.messageType = TLMessageTypeText;
    message2.ownerTyper = TLMessageOwnerTypeOther;
    message2.date = [NSDate date];
    message2.text = @"老公：老婆，你驾照也考下来了，朕带你去看车。老婆满脸兴奋，跟着老公就去了，老公带着老婆逛了宝马，奔驰，路虎，保时捷各种好车的专卖店。老婆都泪崩了，这辈子没白嫁啊！出来后，老公：老婆，看见没，以后这些车你都别撞啊！";
    [_chatMessageVC addNewMessage:message2];
    
    TLMessage *message3 = [[TLMessage alloc] init];
    message3.from = _user;
    message3.messageType = TLMessageTypeText;
    message3.ownerTyper = TLMessageOwnerTypeSelf;
    message3.date = [NSDate date];
    message3.text = @"有天小侄子问我：“啥时候我才能长大？”\n我问他：“当你看电视看到女主角快被糟蹋的时候，心里想的是什么？”\n“当然是希望男主角快点出现来救女主角啊。”\n“我跟你恰恰相反，这就是小屁孩跟大人的区别。”";
    [_chatMessageVC addNewMessage:message3];
    
    TLMessage *message4 = [[TLMessage alloc] init];
    message4.from = _user;
    message4.messageType = TLMessageTypeImage;
    message4.ownerTyper = TLMessageOwnerTypeOther;
    message4.date = [NSDate date];
    message4.imagePath = @"1000.jpg";
    [_chatMessageVC addNewMessage:message4];
    
    TLMessage *message5 = [[TLMessage alloc] init];
    message5.from = _user;
    message5.messageType = TLMessageTypeImage;
    message5.ownerTyper = TLMessageOwnerTypeSelf;
    message5.date = [NSDate date];
    message5.imagePath = @"1001.jpg";
    [_chatMessageVC addNewMessage:message5];
    [_chatMessageVC addNewMessage:message5];
    
    TLMessage *message6 = [[TLMessage alloc] init];
    message6.from = _user;
    message6.messageType = TLMessageTypeText;
    message6.ownerTyper = TLMessageOwnerTypeOther;
    message6.date = [NSDate date];
    message6.text = @"哈";
    [_chatMessageVC addNewMessage:message6];
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
    }
    return _chatMessageVC;
}

- (TLChatBoxViewController *) chatBoxVC
{
    if (_chatBoxVC == nil) {
        _chatBoxVC = [[TLChatBoxViewController alloc] init];
        [_chatBoxVC.view setFrame:CGRectMake(0, HEIGHT_SCREEN - HEIGHT_TABBAR, WIDTH_SCREEN, HEIGHT_TABBAR)];
        [_chatBoxVC setDelegate:self];
    }
    return _chatBoxVC;
}


@end
