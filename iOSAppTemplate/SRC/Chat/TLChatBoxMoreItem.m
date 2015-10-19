//
//  TLChatBoxMoreItem.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/17.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLChatBoxMoreItem.h"

@interface TLChatBoxMoreItem ()
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation TLChatBoxMoreItem

+ (TLChatBoxMoreItem *) createChatBoxMoreItemWithTitle:(NSString *)title imageName:(NSString *)imageName imageHLName:(NSString *)imageHLName
{
    TLChatBoxMoreItem *item = [[TLChatBoxMoreItem alloc] init];
    item.title = title;
    item.imageName = imageName;
    item.imageHLName = imageHLName;
    return item;
}

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.button];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    float space = self.frame.size.width * 0.15;
    float y = space;
    [self.button setFrame:CGRectMake(space, y, self.frameWidth - space * 2, self.frameWidth - space * 2)];
    y += self.button.frameHeight + space;
    [self.titleLabel setFrame:CGRectMake(0, y, self.frameWidth, self.frameHeight - y - space)];
}

#pragma mark - Setter
- (void) setTitle:(NSString *)title
{
    _title = title;
    [self.titleLabel setText:title];
}

- (void) setImageName:(NSString *)imageName
{
    _imageName = imageName;
    [self.button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void) setImageHLName:(NSString *)imageHLName
{
    _imageHLName = imageHLName;
    [self.button setImage:[UIImage imageNamed:imageHLName] forState:UIControlStateHighlighted];
}

#pragma mark - Getter
- (UIButton *) button
{
    if (_button == nil) {
        _button = [[UIButton alloc] init];
    }
    return _button;
}

- (UILabel *) titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

@end
