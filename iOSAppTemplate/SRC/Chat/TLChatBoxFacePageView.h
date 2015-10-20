//
//  TLChatBoxFacePageView.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/20.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLFace.h"

@interface TLChatBoxFacePageView : UIView

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) UIControlEvents controlEvents;

- (void) showFaceGroup:(TLFaceGroup *)group formIndex:(int)fromIndex count:(int)count;
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end
