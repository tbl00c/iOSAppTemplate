//
//  TLChatMessageViewContrller.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLMessage.h"

@interface TLChatMessageViewContrller : UITableViewController

@property (nonatomic, strong) NSMutableArray *data;

- (void) addNewMessage:(TLMessage *)message;
- (void) scrollToBottom;

@end
