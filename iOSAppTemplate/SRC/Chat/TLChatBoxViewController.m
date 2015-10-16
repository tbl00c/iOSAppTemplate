//
//  TLChatBoxViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLChatBoxViewController.h"
#import "TLChatBox.h"

@interface TLChatBoxViewController ()

@property (nonatomic, assign) CGRect keyboardFrame;

@property (nonatomic, strong) TLChatBox *chatBox;

@end

@implementation TLChatBoxViewController

#pragma mark - LifeCycle
- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.chatBox];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.chatBox resignFirstResponder];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Private Methods
- (void)keyboardWillHide:(NSNotification *)notification{
    self.keyboardFrame = CGRectZero;
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
        [_delegate chatBoxViewController:self didChangeChatBoxHeight:HEIGHT_TABBAR];
    }
}

- (void)keyboardFrameWillChange:(NSNotification *)notification{
    self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
        [_delegate chatBoxViewController:self didChangeChatBoxHeight:self.keyboardFrame.size.height + HEIGHT_TABBAR];
    }
}

#pragma mark - Getter
- (TLChatBox *) chatBox
{
    if (_chatBox == nil) {
        _chatBox = [[TLChatBox alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_TABBAR)];
    }
    return _chatBox;
}

@end
