//
//  TLFriendHeaderView.m
//  iOSAppTemplate
//
//  Created by libokun on 15/11/7.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLFriendHeaderView.h"

@interface TLFriendHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TLFriendHeaderView

- (id) initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIView *bgView = [UIView new];
        [bgView setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
        [self setBackgroundView:bgView];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel setFrame:CGRectMake(10, 0, self.frameWidth - 15, self.frameHeight)];
}

- (void) setTitle:(NSString *)title
{
    _title = title;
    [_titleLabel setText:title];
}

- (UILabel *) titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:14.5f]];
        [_titleLabel setTextColor:[UIColor grayColor]];
    }
    return _titleLabel;
}
@end
