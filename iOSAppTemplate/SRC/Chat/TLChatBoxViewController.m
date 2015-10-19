//
//  TLChatBoxViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLChatBoxViewController.h"
#import "TLChatBox.h"
#import "TLChatBoxMoreView.h"
#import "TLChatBoxFaceView.h"

@interface TLChatBoxViewController () <TLChatBoxDelegate>

@property (nonatomic, assign) CGFloat curHeight;
@property (nonatomic, assign) CGRect keyboardFrame;

@property (nonatomic, strong) TLChatBox *chatBox;
@property (nonatomic, strong) TLChatBoxMoreView *chatBoxMoreView;
@property (nonatomic, strong) TLChatBoxFaceView *chatBoxFaceView;

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

#pragma mark - TLChatBoxDelegate
- (void) chatBox:(TLChatBox *)chatBox changeStatusForm:(TLChatBoxStatus)fromStatus to:(TLChatBoxStatus)toStatus
{
    if (toStatus == TLChatBoxStatusShowKeyboard) {      // 显示键盘
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.chatBoxFaceView removeFromSuperview];
            [self.chatBoxMoreView removeFromSuperview];
        });
        return;
    }
    else if (toStatus == TLChatBoxStatusShowVoice) {    // 显示语音输入按钮
        // 从显示更多或表情状态 到 显示语音状态需要动画
        if (fromStatus == TLChatBoxStatusShowMore || fromStatus == TLChatBoxStatusShowFace) {
            [UIView animateWithDuration:0.3 animations:^{
                _curHeight = HEIGHT_TABBAR;
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:_curHeight];
                }
            } completion:^(BOOL finished) {
                [self.chatBoxFaceView removeFromSuperview];
                [self.chatBoxMoreView removeFromSuperview];
            }];
        }
    }
    else if (toStatus == TLChatBoxStatusShowFace) {     // 显示表情面板
        if (fromStatus == TLChatBoxStatusShowVoice || fromStatus == TLChatBoxStatusNothing) {
            [self.chatBoxFaceView setOriginY:HEIGHT_TABBAR];
            [self.view addSubview:self.chatBoxFaceView];
            [UIView animateWithDuration:0.3 animations:^{
                _curHeight = HEIGHT_TABBAR + HEIGHT_CHATBOXVIEW;
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:_curHeight];
                }
            }];
        }
        else {
            // 表情高度变化
            self.chatBoxFaceView.originY = HEIGHT_TABBAR + HEIGHT_CHATBOXVIEW;
            [self.view addSubview:self.chatBoxFaceView];
            [UIView animateWithDuration:0.3 animations:^{
                self.chatBoxFaceView.originY = HEIGHT_TABBAR;
            } completion:^(BOOL finished) {
                [self.chatBoxMoreView removeFromSuperview];
            }];
            // 整个界面高度变化
            if (fromStatus != TLChatBoxStatusShowMore) {
                [UIView animateWithDuration:0.2 animations:^{
                    _curHeight = HEIGHT_TABBAR + HEIGHT_CHATBOXVIEW;
                    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                        [_delegate chatBoxViewController:self didChangeChatBoxHeight:_curHeight];
                    }
                }];
            }
        }
    }
    else if (toStatus == TLChatBoxStatusShowMore) {     // 显示更多面板
        if (fromStatus == TLChatBoxStatusShowVoice || fromStatus == TLChatBoxStatusNothing) {
            [self.chatBoxMoreView setOriginY:HEIGHT_TABBAR];
            [self.view addSubview:self.chatBoxMoreView];
            [UIView animateWithDuration:0.3 animations:^{
                _curHeight = HEIGHT_TABBAR + HEIGHT_CHATBOXVIEW;
                if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                    [_delegate chatBoxViewController:self didChangeChatBoxHeight:_curHeight];
                }
            }];
        }
        else {
            self.chatBoxMoreView.originY = HEIGHT_TABBAR + HEIGHT_CHATBOXVIEW;
            [self.view addSubview:self.chatBoxMoreView];
            [UIView animateWithDuration:0.3 animations:^{
                self.chatBoxMoreView.originY = HEIGHT_TABBAR;
            } completion:^(BOOL finished) {
                [self.chatBoxFaceView removeFromSuperview];
            }];
            
            if (fromStatus != TLChatBoxStatusShowFace) {
                [UIView animateWithDuration:0.2 animations:^{
                    _curHeight = HEIGHT_TABBAR + HEIGHT_CHATBOXVIEW;
                    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
                        [_delegate chatBoxViewController:self didChangeChatBoxHeight:_curHeight];
                    }
                }];
            }
        }
    }
}

#pragma mark - Private Methods
- (void)keyboardWillHide:(NSNotification *)notification{
    self.keyboardFrame = CGRectZero;
    if (_chatBox.status == TLChatBoxStatusShowFace || _chatBox.status == TLChatBoxStatusShowMore) {
        return;
    }
    _curHeight = HEIGHT_TABBAR;
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
        [_delegate chatBoxViewController:self didChangeChatBoxHeight:_curHeight];
    }
}

- (void)keyboardFrameWillChange:(NSNotification *)notification{
    self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (_chatBox.status == TLChatBoxStatusShowKeyboard && self.keyboardFrame.size.height <= HEIGHT_CHATBOXVIEW) {
        return;
    }
    else if ((_chatBox.status == TLChatBoxStatusShowFace || _chatBox.status == TLChatBoxStatusShowMore) && self.keyboardFrame.size.height <= HEIGHT_CHATBOXVIEW) {
        return;
    }
    _curHeight = self.keyboardFrame.size.height + HEIGHT_TABBAR;
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxViewController:didChangeChatBoxHeight:)]) {
        [_delegate chatBoxViewController:self didChangeChatBoxHeight: _curHeight];
    }
}

#pragma mark - Getter
- (TLChatBox *) chatBox
{
    if (_chatBox == nil) {
        _chatBox = [[TLChatBox alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_TABBAR)];
        [_chatBox setDelegate:self];
    }
    return _chatBox;
}

- (TLChatBoxMoreView *) chatBoxMoreView
{
    if (_chatBoxMoreView == nil) {
        _chatBoxMoreView = [[TLChatBoxMoreView alloc] initWithFrame:CGRectMake(0, HEIGHT_TABBAR, WIDTH_SCREEN, HEIGHT_CHATBOXVIEW)];
        [_chatBoxMoreView setBackgroundColor:[UIColor orangeColor]];
    }
    return _chatBoxMoreView;
}

- (TLChatBoxFaceView *) chatBoxFaceView
{
    if (_chatBoxFaceView == nil) {
        _chatBoxFaceView = [[TLChatBoxFaceView alloc] initWithFrame:CGRectMake(0, HEIGHT_TABBAR, WIDTH_SCREEN, HEIGHT_CHATBOXVIEW)];
        [_chatBoxFaceView setBackgroundColor:[UIColor redColor]];
    }
    return _chatBoxFaceView;
}

@end
