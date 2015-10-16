//
//  TLMessageCell.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/16.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLMessage.h"

@interface TLMessageCell : UITableViewCell

@property (nonatomic, strong) TLMessage *message;

@property (nonatomic, strong) UIImageView *avatarImageView;                 // 头像
@property (nonatomic, strong) UIImageView *messageBackgroundImageView;      // 消息背景
@property (nonatomic, strong) UIImageView *messageSendStatusImageView;      // 消息发送状态



@end
