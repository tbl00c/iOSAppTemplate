//
//  TLMessage.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/16.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLMessage.h"

static UILabel *label = nil;

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
    return self.messageSize.height + 40 > 60 ? self.messageSize.height + 40 : 60;
}

@end
