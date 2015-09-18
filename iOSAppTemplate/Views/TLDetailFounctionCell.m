//
//  TLFounctionCell.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/18.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLDetailFounctionCell.h"

@implementation TLDetailFounctionCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [self addSubview:_titleLabel];
        _subTitleLabel = [[UILabel alloc] init];
        [_subTitleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [self addSubview:_subTitleLabel];
    }
    return self;
}

- (void) layoutSubviews
{
    self.leftFreeSpace = self.frameWidth * 0.05;
    [super layoutSubviews];
    
    float spaceX = self.frameWidth * 0.05;
    float spaceY = self.frameHeight * 0.17;
    float labelWidth = self.frameWidth * 0.6 - spaceX;
    float labelHeight = self.frameHeight - spaceY * 2;
    [_titleLabel setFrame:CGRectMake(spaceX, spaceY, labelWidth, labelHeight)];
    
    float labelX = labelWidth + spaceX * 2;
    labelWidth = self.frameWidth - spaceX - labelWidth ;
    [_subTitleLabel setFrame:CGRectMake(labelX, spaceY, labelWidth, labelHeight)];
}

- (void) setTitle:(NSString *)title
{
    _title = title;
    [_titleLabel setText:title];
}

- (void) setSubTitle:(NSString *)subTitle
{
    _subTitle = subTitle;
    [_subTitleLabel setText:_subTitle];
}

@end
