//
//  TLChatBoxViewController.h
//  iOSAppTemplate
//
//  Created by libokun on 15/10/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLChatBoxViewController;
@protocol TLChatBoxViewControllerDelegate <NSObject>
- (void) chatBoxViewController:(TLChatBoxViewController *)chatboxViewController
         didChangeChatBoxHeight:(CGFloat)height;
@end


@interface TLChatBoxViewController : UIViewController

@property id<TLChatBoxViewControllerDelegate>delegate;

@end
