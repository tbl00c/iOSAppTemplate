//
//  TLInfoCell.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/18.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLDetailInfoCell.h"

@interface TLDetailInfoCell ()

@property (nonatomic, strong) NSMutableArray *imageData;

@end

@implementation TLDetailInfoCell

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
    float labelWidth = self.frameWidth * 0.21;
    float labelHeight = self.frameHeight - spaceY * 2;
    [_titleLabel setFrame:CGRectMake(spaceX, spaceY, labelWidth, labelHeight)];
    
    float labelX = labelWidth + spaceX * 2;
    if (_imageData == nil) {
        labelWidth = self.frameWidth - spaceX * 2 ;
        [_subTitleLabel setFrame:CGRectMake(labelX, spaceY, labelWidth, labelHeight)];
    }
    else {
        float imageY = self.frameHeight * 0.17;
        float imageWidth = self.frameHeight * 0.66;
        spaceX = 0;
        for (int i = 0; i < _imageData.count && i < 3; i ++) {
            UIImageView *iV = [_imageData objectAtIndex:i];
            [iV setFrame:CGRectMake(labelX + (imageWidth + spaceX)* i, imageY, imageWidth, imageWidth)];
            spaceX = imageWidth * 0.1;
        }
    }
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

- (void) setImagesArray:(NSArray *)imagesArray
{
    _imagesArray = imagesArray;
    _imageData = [[NSMutableArray alloc] init];
    for (NSString *imageName in _imagesArray) {
        UIImageView *iV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        [_imageData addObject:iV];
        [self addSubview:iV];
    }
    [self layoutSubviews];
}


@end
