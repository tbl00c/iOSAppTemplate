//
//  TLChatBoxFaceView.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLChatBoxFaceView.h"
#import "TLChatBoxFaceGroupView.h"
#import "TLFaceHelper.h"

#define     HEIGHT_BOTTOM_VIEW          36.0f

@interface TLChatBoxFaceView () <TLChatBoxFaceGroupViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) TLFaceGroup *curGroup;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) TLChatBoxFaceGroupView *faceGroupView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *faceViewArray;

@end

@implementation TLChatBoxFaceView

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:DEFAULT_CHATBOX_COLOR];
        [self addSubview:self.topLine];
        [self addSubview:self.faceGroupView];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
    }
    return self;
}

- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self.scrollView setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - HEIGHT_BOTTOM_VIEW - 18)];
    [self.pageControl setFrame:CGRectMake(0, self.scrollView.frameHeight + 3, frame.size.width, 8)];
}

#pragma mark - TLChatBoxFaceGroupViewDelegate
- (void) chatBoxFaceGroupView:(TLChatBoxFaceGroupView *)chatBoxFaceGroupView didSelectedFaceGroupIndex:(NSInteger)index
{
    _curGroup = [[[TLFaceHelper sharedFaceHelper] faceGroupArray] objectAtIndex:index];
    if (_curGroup.facesArray == nil) {
        _curGroup.facesArray = [[TLFaceHelper sharedFaceHelper] getFaceArrayByGroupID:_curGroup.groupID];
    }
    [self reloadScrollView];
}

- (void) chatBoxFaceGroupViewSendButtonDown
{
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewDeleteButtonDown)]) {
        [_delegate chatBoxFaceViewSendButtonDown];
    }
}

- (void) chatBoxFaceGroupViewAddButtonDown
{
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewSendButtonDown)]) {
        [_delegate chatBoxFaceViewSendButtonDown];
    }
}

#pragma mark - UIScrollViewDelegate
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / self.frameWidth;
    [_pageControl setCurrentPage:page];
}

#pragma mark - Event Response
- (void) didSelectedFace:(UIButton *)sender
{
    TLFace *face = [_curGroup.facesArray objectAtIndex:sender.tag];
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewDidSelectedFace:type:)]) {
        [_delegate chatBoxFaceViewDidSelectedFace:face type:_curGroup.faceType];
    }
}

- (void) deleteButtonDown
{
    if (_delegate && [_delegate respondsToSelector:@selector(chatBoxFaceViewDeleteButtonDown)]) {
        [_delegate chatBoxFaceViewDeleteButtonDown];
    }
}

#pragma mark - Private Methods
- (void) reloadScrollView
{
    for (UIButton *button in self.faceViewArray) {
        [button removeFromSuperview];
    }
    [self.faceViewArray removeAllObjects];
    int page = (int)(self.curGroup.facesArray.count / (self.curGroup.faceType == TLFaceTypeEmoji ? 20 : 8)) + (int)(self.curGroup.facesArray.count % (self.curGroup.faceType == TLFaceTypeEmoji ? 20 : 8));
    [self.pageControl setNumberOfPages:page];
    [self.scrollView setContentSize:CGSizeMake(WIDTH_SCREEN * page, self.scrollView.frameHeight)];
    
    float spaceX = 12;
    float spaceY = 10;
    float w =  (WIDTH_SCREEN - spaceX * 2) / (_curGroup.faceType == TLFaceTypeEmoji ? 7 : 4);
    float h = _curGroup.faceType == TLFaceTypeEmoji ? (self.scrollView.frameHeight - spaceY * 2) / 3 : w * 1.2;
    float x = spaceX;
    float y = spaceY;
   
    int index = 0, curPage = 0;
    for (int i = 0; i < _curGroup.facesArray.count; i ++) {
        TLFace *face = [_curGroup.facesArray objectAtIndex:i];
        if (_curGroup.faceType == TLFaceTypeEmoji) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, w, h)];
            if (++index % 21 == 0) {
                [button setImage:[UIImage imageNamed:@"DeleteEmoticonBtn"] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(deleteButtonDown) forControlEvents:UIControlEventTouchUpInside];
                i --;
            }
            else {
                button.tag = i;
                [button setImage:[UIImage imageNamed:face.faceName] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(didSelectedFace:) forControlEvents:UIControlEventTouchUpInside];
            }
            [self.scrollView addSubview:button];
            curPage = (index % 21 == 0 ? curPage + 1 : curPage);
            x = (index % 7 == 0 ? curPage * WIDTH_SCREEN + spaceX: x + w);
            y = (index % 7 == 0 ?  (index % 21 == 0 ? spaceY : y + h) : y);
        }
    }
    if (_curGroup.facesArray.count % 20 != 0) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [button setImage:[UIImage imageNamed:@"DeleteEmoticonBtn"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(deleteButtonDown) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
    }
}

- (void) pageControlClicked:(UIPageControl *)pageControl
{
    [self.scrollView scrollRectToVisible:CGRectMake(pageControl.currentPage * WIDTH_SCREEN, 0, WIDTH_SCREEN, self.scrollView.frameHeight) animated:YES];
}

#pragma mark - Getter
- (UIView *) topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 0.5)];
        [_topLine setBackgroundColor:DEFAULT_LINE_GRAY_COLOR];
    }
    return _topLine;
}

- (TLChatBoxFaceGroupView *) faceGroupView
{
    if (_faceGroupView == nil) {
        _faceGroupView = [[TLChatBoxFaceGroupView alloc] initWithFrame:CGRectMake(0, self.frameHeight - HEIGHT_BOTTOM_VIEW, WIDTH_SCREEN, HEIGHT_BOTTOM_VIEW)];
        [_faceGroupView setDelegate:self];
        [_faceGroupView setFaceGroupArray:[[TLFaceHelper sharedFaceHelper] faceGroupArray]];
    }
    return _faceGroupView;
}

- (UIPageControl *) pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        _pageControl.pageIndicatorTintColor = DEFAULT_LINE_GRAY_COLOR;
        [_pageControl addTarget:self action:@selector(pageControlClicked:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (UIScrollView *) scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setScrollsToTop:NO];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setDelegate:self];
        [_scrollView setPagingEnabled:YES];
    }
    return _scrollView;
}

- (NSMutableArray *) faceViewArray
{
    if (_faceViewArray == nil) {
        _faceViewArray = [[NSMutableArray alloc] init];
    }
    return _faceViewArray;
}

@end
