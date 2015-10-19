//
//  TLChatBox.h
//  iOSAppTemplate
//
//  Created by libokun on 15/10/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLFace.h"

typedef NS_ENUM(NSInteger, TLChatBoxStatus) {
    TLChatBoxStatusNothing,
    TLChatBoxStatusShowVoice,
    TLChatBoxStatusShowFace,
    TLChatBoxStatusShowMore,
    TLChatBoxStatusShowKeyboard,
};

@class TLChatBox;
@protocol TLChatBoxDelegate <NSObject>
- (void)chatBox:(TLChatBox *)chatBox changeStatusForm:(TLChatBoxStatus)fromStatus to:(TLChatBoxStatus)toStatus;
- (void)chatBox:(TLChatBox *)chatBox sendTextMessage:(NSString *)textMessage;
@end

@interface TLChatBox : UIView

@property (nonatomic, assign) id<TLChatBoxDelegate>delegate;
@property (nonatomic, assign) TLChatBoxStatus status;

- (void) addEmojiFace:(TLFace *)face;
- (void) sendCurrentMessage;
- (void) deleteButtonDown;

@end
