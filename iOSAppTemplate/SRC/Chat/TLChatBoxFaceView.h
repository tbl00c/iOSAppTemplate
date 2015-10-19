//
//  TLChatBoxFaceView.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLFace.h"

@protocol TLChatBoxFaceViewDelegate <NSObject>
- (void) chatBoxFaceViewDidSelectedFace:(TLFace *)face type:(TLFaceType)type;
- (void) chatBoxFaceViewDeleteButtonDown;
- (void) chatBoxFaceViewSendButtonDown;
@end

@interface TLChatBoxFaceView : UIView

@property (nonatomic, assign) id<TLChatBoxFaceViewDelegate>delegate;

@end
