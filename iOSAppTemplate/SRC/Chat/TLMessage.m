//
//  TLMessage.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/16.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLMessage.h"

static UILabel *label = nil;
static UIImage *image = nil;

@implementation TLMessage

- (id) init
{
    if (self = [super init]) {
        if (label == nil) {
            label = [[UILabel alloc] init];
            [label setNumberOfLines:0];
            [label setFont:[UIFont systemFontOfSize:16.0f]];
        }
    }
    return self;
}

#pragma mark - Getter and Setter
- (void) setMessageType:(TLMessageType)messageType
{
    _messageType = messageType;
    switch (messageType) {
        case TLMessageTypeText:
            self.cellIndentify = @"TextMessageCell";
            break;
        case TLMessageTypeImage:
            self.cellIndentify = @"ImageMessageCell";
            break;
        case TLMessageTypeVoice:
            self.cellIndentify = @"VoiceMessageCell";
            break;
        case TLMessageTypeSystem:
            self.cellIndentify = @"SystemMessageCell";
            break;
        default:
            break;
    }
}

- (CGSize) messageSize
{
    switch (self.messageType) {
        case TLMessageTypeText:
            [label setText:self.text];
            _messageSize = [label sizeThatFits:CGSizeMake(WIDTH_SCREEN * 0.6, MAXFLOAT)];
            break;
        case TLMessageTypeImage:
            image = [UIImage imageNamed:self.imagePath];
            _messageSize = (image.size.width > WIDTH_SCREEN * 0.5 ? CGSizeMake(WIDTH_SCREEN * 0.5, WIDTH_SCREEN * 0.5 / image.size.width * image.size.height) : image.size);
            _messageSize = _messageSize.height > 60 ? _messageSize : CGSizeMake(60 / _messageSize.height ( _messageSize.width), 60)
            break;
        case TLMessageTypeVoice:

            break;
        case TLMessageTypeSystem:

            break;
        default:
            break;
    }
    return _messageSize;
}

- (CGFloat) cellHeight
{
    switch (self.messageType) {     // cell 上下间隔为10
        case TLMessageTypeText:
            return self.messageSize.height + 40 > 60 ? self.messageSize.height + 40 : 60;
            break;
        case TLMessageTypeImage:
            return self.messageSize.height + 20;
            break;
        default:
            break;
    }
    return 0;
}

@end
