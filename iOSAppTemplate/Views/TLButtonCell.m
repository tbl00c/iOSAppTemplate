//
//  TLButtonCell.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/18.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLButtonCell.h"

@implementation TLButtonCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setTopLineStyle:CellLineStyleNone];
        [self setBottomLineStyle:CellLineStyleNone];
        _button = [[UIButton alloc] init];
        [_button.layer setMasksToBounds:YES];
        [_button.layer setCornerRadius:5.0f];
        [_button.layer setBorderWidth:0.5f];
        [_button.layer setBorderColor:DEFAULT_LINE_GRAY_COLOR.CGColor];
        [_button setBackgroundColor:[UIColor whiteColor]];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_button];
    }
    return self;
}

- (void) layoutSubviews
{
    self.leftFreeSpace = self.frameWidth * 0.05;
    [super layoutSubviews];
    
    float buttonX = self.frameWidth * 0.04;
    float buttonY = self.frameHeight * 0.09;
    float buttonWidth = self.frameWidth - buttonX * 2;
    float buttonHeight = self.frameHeight - buttonY * 2;
    [_button setFrame:CGRectMake(buttonX, 0, buttonWidth, buttonHeight)];
}

- (void) setButtonTitle:(NSString *)buttonTitle
{
    [_button setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void) setButtonTitleColor:(UIColor *)buttonTitleColor
{
    [_button setTitleColor:buttonTitleColor forState:UIControlStateNormal];
}

- (void) setButtonBackgroundGColor:(UIColor *)buttonBackgroundGColor
{
    [_button setBackgroundColor:buttonBackgroundGColor];
}

- (void)addTarget:(nullable id)target action:(SEL)action
{
    [_button addTarget:target action:action forControlEvents:UIControlEventTouchDown];
}

@end
