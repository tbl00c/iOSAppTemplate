//
//  TLUserDetailCell.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/18.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLUserDetailCell.h"

@interface TLUserDetailCell ()

@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *userIDLabel;
@property (nonatomic, strong) UILabel *nikeNameLabel;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *subImageView;

@end

@implementation TLUserDetailCell

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
        [_userIDLabel setTextColor:DEFAULT_TEXT_GRAY_COLOR];
        [self addSubview:_userIDLabel];
        _nikeNameLabel = [[UILabel alloc] init];
        [_nikeNameLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [_nikeNameLabel setTextColor:DEFAULT_TEXT_GRAY_COLOR];
        [self addSubview:_nikeNameLabel];
    }
    return self;
}

- (void) layoutSubviews
{
    self.leftFreeSpace = self.frameWidth * 0.05;
    [super layoutSubviews];
    
    float spaceX = self.frameWidth * 0.04;
    float spaceY = self.frameHeight * 0.15;
    float imageWidth = self.frameHeight - spaceY * 2;
    [_avatarImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    float labelX = imageWidth + spaceX * 2;
    float labelWidth = self.frameWidth - labelX - spaceX * 1.5;
    CGSize size = [_userIDLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    float labelHeight = imageWidth * 0.42;
    size.width = size.width > labelWidth ? labelWidth : size.width;
    float labelY = _cellType == UserDetailCellTypeMine ? spaceY * 1.45 : spaceY;
    [_usernameLabel setFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
   
    size = [_userIDLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    labelY += labelHeight + (_cellType == UserDetailCellTypeMine ? spaceY * 0.3 : spaceY * 0.2);
    [_userIDLabel setFrame:CGRectMake(labelX, labelY, size.width, size.height)];
   
    size = [_nikeNameLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    labelY = _userIDLabel.originY + _userIDLabel.frameHeight + spaceY * 0.15;
    [_nikeNameLabel setFrame:CGRectMake(labelX, labelY, size.width, size.height)];
}

- (void) setCellType:(UserDetailCellType)cellType
{
    _cellType = cellType;
    switch (_cellType) {
        case UserDetailCellTypeFriends:
            [_userIDLabel setTextColor:DEFAULT_TEXT_GRAY_COLOR];
            [_userIDLabel setFont:[UIFont systemFontOfSize:13.0f]];
            break;
        case UserDetailCellTypeMine:
            [_userIDLabel setTextColor:[UIColor blackColor]];

            [_userIDLabel setFont:[UIFont systemFontOfSize:14.0f]];
            [_nikeNameLabel setHidden:YES];
            break;
        default:
            break;
    }
    [self sizeToFit];
}

- (void) setUser:(TLUser *)user
{
    [_avatarImageView setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%@", user.avatarURL]]];
    if (user.username && user.username.length > 0) {
        [_usernameLabel setText:user.username];
        if (user.nikename && user.nikename.length > 0) {
            [_nikeNameLabel setText:[NSString stringWithFormat:@"昵称：%@", user.nikename]];
        }
        else {
            [_nikeNameLabel setText:@""];
        }
    }
    else if (user.nikename && user.nikename.length > 0) {
        [_usernameLabel setText:user.nikename];
    }
    
    if (user.userID && user.userID.length > 0) {
        [_userIDLabel setText:[NSString stringWithFormat:@"微信号：%@", user.userID]];
    }
    else {
        [_userIDLabel setText:@""];
    }
}

@end
