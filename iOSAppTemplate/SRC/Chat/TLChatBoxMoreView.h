//
//  TLChatBoxMoreView.h
//  iOSAppTemplate
//
//  Created by libokun on 15/10/17.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLChatBoxMoreItem.h"

@class TLChatBoxMoreView;
@protocol TLChatBoxMoreViewDelegate <NSObject>
- (void)chatBoxMoreView:(TLChatBoxMoreView *)chatBoxMoreView didSelectItemIndex:(int)index;
@end

@interface TLChatBoxMoreView : UIView

@property (nonatomic, strong) id<TLChatBoxMoreViewDelegate>delegate;
@property (nonatomic, strong) NSMutableArray *items;

@end
