//
//  TLImageMessageCell.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/16.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLImageMessageCell.h"

@implementation TLImageMessageCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.messageImageView];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    float x = self.avatarImageView.originX + (self.message.ownerTyper == TLMessageOwnerTypeSelf ? - self.messageImageView.frameWidth - 12 : self.avatarImageView.frameWidth + 12);
    [self.messageImageView setOrigin:CGPointMake(x, self.avatarImageView.originY)];
    [self.messageBackgroundImageView setFrame:CGRectMake(x - 8, self.avatarImageView.originY - 5, self.messageImageView.frameWidth + 16, self.messageImageView.frameHeight
                                                         )];
}

#pragma mark - Getter and Setter
- (void) setMessage:(TLMessage *)message
{
    [super setMessage:message];
    if(message.imagePath != nil) {
        [self.messageImageView setImage:[UIImage imageNamed:message.imagePath]];
        [self.messageImageView setSize:message.messageSize];
    }
}

- (UIImageView *) messageImageView
{
    if (_messageImageView == nil) {
        _messageImageView = [[UIImageView alloc] init];
    }
    return _messageImageView;
}


@end
