//
//  TLMineCell.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/18.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLMineCell.h"

@interface TLMineCell ()

@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *userIDLabel;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *subImageView;

@end

@implementation TLMineCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _avatarImageView = [[UIImageView alloc] init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:5.0f];
        [self addSubview:_avatarImageView];
        _usernameLabel = [[UILabel alloc] init];
        [_usernameLabel setFont:[UIFont systemFontOfSize:17.0f]];
        [self addSubview:_usernameLabel];
        _userIDLabel = [[UILabel alloc] init];
        [_userIDLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [self addSubview:_userIDLabel];
    }
    return self;
}

- (void) layoutSubviews
{
    self.leftFreeSpace = self.frameWidth * 0.05;
    [super layoutSubviews];
    
    float spaceX = self.frameWidth * 0.05;
    float spaceY = self.frameHeight * 0.15;
    float imageWidth = self.frameHeight - spaceY * 2;
    [_avatarImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    float labelX = imageWidth + spaceX * 2;
    float labelWidth = self.frameWidth - labelX - spaceX * 1.5;
    float labelHeight = imageWidth * 0.42;
    [_usernameLabel setFrame:CGRectMake(labelX, spaceY + imageWidth * 0.08, labelWidth, labelHeight)];
    [_userIDLabel setFrame:CGRectMake(labelX, spaceY + imageWidth * 0.08 + labelHeight, labelWidth, labelHeight)];
}

- (void) setUser:(TLUser *)user
{
    [_avatarImageView setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%@", user.avatarURL]]];
    [_usernameLabel setText:user.username];
    [_userIDLabel setText:[NSString stringWithFormat:@"微信号：%@", user.userID]];
}

@end
