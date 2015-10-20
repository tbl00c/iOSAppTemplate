//
//  TLChatBoxFaceMenuView.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLFace.h"

@class TLChatBoxFaceMenuView;
@protocol TLChatBoxFaceMenuViewDelegate <NSObject>

- (void) chatBoxFaceMenuViewAddButtonDown;
- (void) chatBoxFaceMenuViewSendButtonDown;
- (void) chatBoxFaceMenuView:(TLChatBoxFaceMenuView *)chatBoxFaceMenuView didSelectedFaceMenuIndex:(NSInteger)index;

@end

@interface TLChatBoxFaceMenuView : UIView

@property (nonatomic, assign) id<TLChatBoxFaceMenuViewDelegate>delegate;
@property (nonatomic, strong) NSMutableArray *faceGroupArray;

@end
