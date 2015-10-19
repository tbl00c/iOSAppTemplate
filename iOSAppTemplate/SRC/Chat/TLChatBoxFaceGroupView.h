//
//  TLChatBoxFaceGroupView.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLFace.h"

@class TLChatBoxFaceGroupView;
@protocol TLChatBoxFaceGroupViewDelegate <NSObject>

- (void) chatBoxFaceGroupViewAddButtonDown;
- (void) chatBoxFaceGroupViewSendButtonDown;
- (void) chatBoxFaceGroupView:(TLChatBoxFaceGroupView *)chatBoxFaceGroupView didSelectedFaceGroupIndex:(NSInteger)index;

@end

@interface TLChatBoxFaceGroupView : UIView

@property (nonatomic, assign) id<TLChatBoxFaceGroupViewDelegate>delegate;
@property (nonatomic, strong) NSMutableArray *faceGroupArray;

@end
