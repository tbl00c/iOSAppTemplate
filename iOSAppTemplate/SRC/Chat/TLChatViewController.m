//
//  TLChatViewController.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLChatViewController.h"
#import "TLChatMessageViewContrller.h"

@interface TLChatViewController ()

@property (nonatomic, strong) TLChatMessageViewContrller *chatVC;

@end

@implementation TLChatViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.chatVC.view];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    TLMessage *message = [[TLMessage alloc] init];
    message.from = _user;
    message.messageType = TLMessageTypeText;
    message.ownerTyper = TLMessageOwnerTypeOther;
    message.date = [NSDate date];
    message.text = @"hello world!";
    [_chatVC addNewMessage:message];
    
    TLMessage *message1 = [[TLMessage alloc] init];
    message1.from = _user;
    message1.messageType = TLMessageTypeText;
    message1.ownerTyper = TLMessageOwnerTypeSelf;
    message1.date = [NSDate date];
    message1.text = @"不要和我比懒，我懒得和你比!";
    [_chatVC addNewMessage:message1];
    
    TLMessage *message2 = [[TLMessage alloc] init];
    message2.from = _user;
    message2.messageType = TLMessageTypeText;
    message2.ownerTyper = TLMessageOwnerTypeOther;
    message2.date = [NSDate date];
    message2.text = @"老公：老婆，你驾照也考下来了，朕带你去看车。老婆满脸兴奋，跟着老公就去了，老公带着老婆逛了宝马，奔驰，路虎，保时捷各种好车的专卖店。老婆都泪崩了，这辈子没白嫁啊！出来后，老公：老婆，看见没，以后这些车你都别撞啊！";
    [_chatVC addNewMessage:message2];
    
    TLMessage *message3 = [[TLMessage alloc] init];
    message3.from = _user;
    message3.messageType = TLMessageTypeText;
    message3.ownerTyper = TLMessageOwnerTypeSelf;
    message3.date = [NSDate date];
    message3.text = @"有天小侄子问我：“啥时候我才能长大？”\n我问他：“当你看电视看到女主角快被糟蹋的时候，心里想的是什么？”\n“当然是希望男主角快点出现来救女主角啊。”\n“我跟你恰恰相反，这就是小屁孩跟大人的区别。”";
    [_chatVC addNewMessage:message3];
    
    TLMessage *message4 = [[TLMessage alloc] init];
    message4.from = _user;
    message4.messageType = TLMessageTypeImage;
    message4.ownerTyper = TLMessageOwnerTypeOther;
    message4.date = [NSDate date];
    message4.imagePath = @"1000.jpg";
    [_chatVC addNewMessage:message4];
    
    TLMessage *message5 = [[TLMessage alloc] init];
    message5.from = _user;
    message5.messageType = TLMessageTypeImage;
    message5.ownerTyper = TLMessageOwnerTypeSelf;
    message5.date = [NSDate date];
    message5.imagePath = @"1001.jpg";
    [_chatVC addNewMessage:message5];

}


#pragma mark - Getter and Setter
- (void) setUser:(TLUser *)user
{
    _user = user;
    [self.navigationItem setTitle:user.username];
}

- (TLChatMessageViewContrller *) chatVC
{
    if (_chatVC == nil) {
        _chatVC = [[TLChatMessageViewContrller alloc] init];
        [_chatVC.view setFrame:CGRectMake(0, HEIGHT_STATUSBAR + HEIGHT_NAVBAR, WIDTH_SCREEN, HEIGHT_SCREEN - HEIGHT_TABBAR - HEIGHT_NAVBAR - HEIGHT_STATUSBAR)];
    }
    return _chatVC;
}


@end
