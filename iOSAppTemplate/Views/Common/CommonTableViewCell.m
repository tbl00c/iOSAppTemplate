//
//  CommonTableViewCell.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "CommonTableViewCell.h"

@implementation CommonTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void) layoutSubviews
{
    [self.bottomLine setOriginY:self.frameHeight - _bottomLine.frameHeight];
    [self.topLine setFrameWidth:self.frameWidth];
    [self setBottomLineStyle:_bottomLineStyle];
    [self setTopLineStyle:_topLineStyle];
}

- (void) setTopLineStyle:(CellLineStyle)style
{
    _topLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self addTopLineForm:_leftFreeSpace length:self.frameWidth - _leftFreeSpace];
        [self.topLine setHidden:NO];
    }
    else if (style == CellLineStyleFill) {
        [self addTopLineForm:0 length:self.frameWidth];
        [self.topLine setHidden:NO];
    }
    else if (style == CellLineStyleNone) {
        [self.topLine setHidden:YES];
    }
}

- (void) setBottomLineStyle:(CellLineStyle)style
{
    _bottomLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self addBottomLineForm:_leftFreeSpace length:self.frameWidth - _leftFreeSpace];
        [self.bottomLine setHidden:NO];
    }
    else if (style == CellLineStyleFill) {
        [self addBottomLineForm:0 length:self.frameWidth];
        [self.bottomLine setHidden:NO];
    }
    else if (style == CellLineStyleNone) {
        [self.bottomLine setHidden:YES];
    }
}

- (void) addBottomLineForm:(float)start length:(float)length
{
    [self.bottomLine setOriginX:start];
    [self.bottomLine setFrameWidth:length];
}

- (void) addTopLineForm:(float)start length:(float)length
{
    [self.topLine setOriginX:start];
    [self.topLine setFrameWidth:length];
}

- (UIView *) bottomLine
{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        [_bottomLine setFrameHeight:0.5];
        [_bottomLine setBackgroundColor:[UIColor grayColor]];
        [_bottomLine setAlpha:0.4];
        [self addSubview:_bottomLine];
    }
    return _bottomLine;
}

- (UIView *) topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        [_topLine setFrame:CGRectMake(0, 0, 0, 0.5)];
        [_topLine setBackgroundColor:[UIColor grayColor]];
        [_topLine setAlpha:0.4];
        [self addSubview:_topLine];
    }
    return _topLine;
}

@end
