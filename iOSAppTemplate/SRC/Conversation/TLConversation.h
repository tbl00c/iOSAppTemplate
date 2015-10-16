//
//  TLConversation.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLConversation : NSObject

@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) int messageCount;
@property (nonatomic, strong) NSURL *avatarURL;

@end
