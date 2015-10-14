//
//  TLConversationCell.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLConversationCell.h"

@implementation TLConversationCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _avatarImageView = [[UIImageView alloc] init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:5.0f];
        [self addSubview:_avatarImageView];
        
        _usernameLabel = [[UILabel alloc] init];
        [_usernameLabel setFont:[UIFont systemFontOfSize:16]];
        [self addSubview:_usernameLabel];
        
        _dateLabel = [[UILabel alloc] init];
        [_dateLabel setAlpha:0.8];
        [_dateLabel setFont:[UIFont systemFontOfSize:12]];
        [_dateLabel setTextAlignment:NSTextAlignmentRight];
        [_dateLabel setTextColor:[UIColor grayColor]];
        [self addSubview:_dateLabel];
        
        _messageLabel = [[UILabel alloc] init];
        [_messageLabel setTextColor:[UIColor grayColor]];
        [_messageLabel setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:_messageLabel];
    }
    return self;
}

- (void) layoutSubviews
{
    self.leftFreeSpace = self.frameHeight * 0.14;
    
    [super layoutSubviews];
    
    float imageWidth = self.frameHeight * 0.72;
    float space = self.leftFreeSpace;
    [_avatarImageView setFrame:CGRectMake(space, space, imageWidth, imageWidth)];
    
    float labelX = space * 2 + imageWidth;
    float labelY = self.frameHeight * 0.135;
    float labelHeight = self.frameHeight * 0.4;
    float labelWidth = self.frameWidth - labelX - space * 1.5;
    
    float dateWidth = 70;
    float dateHeight = labelHeight * 0.75;
    float dateX = self.frameWidth - space * 1.5 - dateWidth;
    [_dateLabel setFrame:CGRectMake(dateX, labelY * 0.7, dateWidth, dateHeight)];
    
    float usernameLabelWidth = self.frameWidth - labelX - dateWidth - space * 2;
    [_usernameLabel setFrame:CGRectMake(labelX, labelY, usernameLabelWidth, labelHeight)];
    
    labelY = self.frameHeight * 0.91 - labelHeight;
    [_messageLabel setFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
}

- (void) setConversation:(TLConversation *)conversation
{
    _conversation = conversation;
    [_avatarImageView setImage:[UIImage imageNamed:[NSString stringWithFormat: @"%@", _conversation.avatarURL]]];
    [_usernameLabel setText:_conversation.from];
    [_dateLabel setText:@"11:01"];
    [_messageLabel setText:_conversation.message];
}

@end
