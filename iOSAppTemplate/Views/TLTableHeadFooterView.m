//
//  TLViewHeadFlooterView.m
//  iOSAppTemplate
//
//  Created by libokun on 15/9/30.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLTableHeadFooterView.h"

static UITextView *sTextView = nil;

@implementation TLTableHeadFooterView

- (id) initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setUserInteractionEnabled:NO];
        _textView = [[UITextView alloc] init];
        [_textView setBackgroundColor:[UIColor clearColor]];
        [_textView setFont:[UIFont systemFontOfSize:14.0f]];
        [_textView setTextColor:[UIColor grayColor]];
        [self addSubview:_textView];
    }
    return self;
}

- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    float x = frame.size.width * 0.04;
    float w = frame.size.width - x * 2;
    [self.textView setFrame:CGRectMake(x, 0, w, self.frameHeight)];
}

- (void) setText:(NSString *)text
{
    _text = text;
    [self.textView setText:text];
}

+ (CGFloat) heightForTextToFitView:(NSString *)text
{
    if (sTextView == nil) {
        sTextView = [[UITextView alloc] init];
        [sTextView setFont:[UIFont systemFontOfSize:14.0f]];
    }
    [sTextView setText:text];
    float w = WIDTH_SCREEN * 0.92;
    return [sTextView sizeThatFits:CGSizeMake(w, MAXFLOAT)].height;
}

@end
