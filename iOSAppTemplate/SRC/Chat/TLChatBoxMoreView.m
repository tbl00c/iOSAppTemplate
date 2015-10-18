//
//  TLChatBoxMoreView.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/17.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLChatBoxMoreView.h"

@interface TLChatBoxMoreView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation TLChatBoxMoreView

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
    }
    return self;
}

#pragma mark - Public Methods
- (void) setItems:(NSMutableArray *)items
{
    _items = items;
    _pageControl.numberOfPages = items.count / 8 + 1;
    float x = 0, y = 0;
    float w = self.frameWidth / 4;
    float h = (self.frameHeight - 20) / 2;
    int i = 0, page = 0;
    for (TLChatBoxMoreItem * item in _items) {
        [item removeFromSuperview];
        [item setFrame:CGRectMake(x, y, w, h)];
        i ++;
        page = i % 8 == 0 ? page + 1 : page;
        x = i % 4 ? x + w : page * self.frameWidth;
        y = i % 8 > 4 ? 0 : h;
    }
}

#pragma mark - UIScrollViewDelegate
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / self.frameWidth;
    [_pageControl setCurrentPage:page];
}

#pragma Event Response
- (void) pageControlClicked:(UIPageControl *)pageControl
{
    
}

#pragma mark - Getter
- (UIScrollView *) scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setDelegate:self];
    }
    return _scrollView;
}

- (UIPageControl *) pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        [_pageControl addTarget:self action:@selector(pageControlClicked:) forControlEvents:UIControlEventEditingDidEnd];
    }
    return _pageControl;
}

@end
