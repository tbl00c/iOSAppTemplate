//
//  TLConversationCell.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "TLConversation.h"

@interface TLConversationCell : CommonTableViewCell

@property (nonatomic, strong) TLConversation *conversation;

@end
