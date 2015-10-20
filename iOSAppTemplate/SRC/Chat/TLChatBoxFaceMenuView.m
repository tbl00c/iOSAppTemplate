//
//  TLChatBoxFaceMenuView.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLChatBoxFaceMenuView.h"

@interface TLChatBoxFaceMenuView ()

@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *faceMenuViewArray;

@end

@implementation TLChatBoxFaceMenuView

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.addButton];
        [self addSubview:self.scrollView];
    }
    return self;
}

#pragma mark - Public Methods
- (void) setFaceGroupArray:(NSMutableArray *)faceGroupArray
{
    _faceGroupArray = faceGroupArray;
    float w = self.frameHeight * 1.25;
    [self.addButton setFrame:CGRectMake(0, 0, w, self.frameHeight)];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(w, 6, 0.5, self.frameHeight - 12)];
    [line setBackgroundColor:DEFAULT_LINE_GRAY_COLOR];
    [self addSubview:line];
    [self.sendButton setFrame:CGRectMake(self.frameWidth - w * 1.2, 0, w * 1.2, self.frameHeight)];
    
    [self.scrollView setFrame:CGRectMake(w + 0.5, 0, self.frameWidth - self.addButton.frameWidth, self.frameHeight)];
    [self.scrollView setContentSize:CGSizeMake(w * (faceGroupArray.count + 3), self.scrollView.frameHeight)];
    float x = 0;
    int i = 0;
    for (TLFaceGroup *group in faceGroupArray) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, w, self.frameHeight)];
        [button.imageView setContentMode:UIViewContentModeCenter];
        [button setImage:[UIImage imageNamed:group.groupImageName] forState:UIControlStateNormal];
        [button setTag:i ++];
        [button addTarget:self action:@selector(buttonDown:) forControlEvents:UIControlEventTouchDown];
        [self.faceMenuViewArray addObject:button];
        [self.scrollView addSubview:button];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(button.originX + button.frameWidth, 6, 0.5, self.frameHeight - 12)];
        [line setBackgroundColor:DEFAULT_LINE_GRAY_COLOR];
        [self.scrollView addSubview:line];
        x += button.frameWidth + 0.5;
    }
    [self buttonDown:[self.faceMenuViewArray firstObject]];
}

#pragma mark - Event Response
- (void) buttonDown:(UIButton *)sender
{
    if (sender.tag == -1) {
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceMenuViewAddButtonDown)]) {
            [_delegate chatBoxFaceMenuViewAddButtonDown];
        }
    }
    else if (sender.tag == -2) {
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceMenuViewSendButtonDown)]) {
            [_delegate chatBoxFaceMenuViewSendButtonDown];
        }
    }
    else {
        for (UIButton *button in self.faceMenuViewArray) {
            [button setBackgroundColor:[UIColor whiteColor]];
        }
        [sender setBackgroundColor:DEFAULT_CHATBOX_COLOR];
        if ([[_faceGroupArray objectAtIndex:sender.tag] faceType] == TLFaceTypeEmoji) {
            [self addSubview:self.sendButton];
            [self.scrollView setFrameWidth:self.frameWidth - self.addButton.frameWidth - self.sendButton.frameWidth - 1];
        }
        else {
            [self.sendButton removeFromSuperview];
            [self.scrollView setFrameWidth:self.frameWidth - self.addButton.frameWidth - 0.5];
        }
        if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceMenuView:didSelectedFaceMenuIndex:)]) {
            [_delegate chatBoxFaceMenuView:self didSelectedFaceMenuIndex:sender.tag];
        }
    }
}

#pragma mark - Getter
- (UIButton *) addButton
{
    if (_addButton == nil) {
        _addButton = [[UIButton alloc] init];
        _addButton.tag = -1;
        [_addButton setImage:[UIImage imageNamed:@"Card_AddIcon"] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(buttonDown:) forControlEvents:UIControlEventTouchDown];
    }
    return _addButton;
}

- (UIButton *) sendButton
{
    if (_sendButton == nil) {
        _sendButton = [[UIButton alloc] init];
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendButton.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [_sendButton setBackgroundColor:[UIColor colorWithRed:0.1 green:0.4 blue:0.8 alpha:1.0]];
        _sendButton.tag = -2;
        [_sendButton addTarget:self action:@selector(buttonDown:) forControlEvents:UIControlEventTouchDown];
    }
    return _sendButton;
}

- (UIScrollView *) scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setScrollsToTop:NO];
    }
    return _scrollView;
}

- (NSMutableArray *) faceMenuViewArray
{
    if (_faceMenuViewArray == nil) {
        _faceMenuViewArray = [[NSMutableArray alloc] init];
    }
    return _faceMenuViewArray;
}

@end
