//
//  TLMessage.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/16.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "TLUser.h"

/**
 *  消息拥有者
 */
typedef NS_ENUM(NSUInteger, TLMessageOwnerType){
    TLMessageOwnerTypeUnknown,  // 未知的消息拥有者
    TLMessageOwnerTypeSystem,   // 系统消息
    TLMessageOwnerTypeSelf,     // 自己发送的消息
    TLMessageOwnerTypeOther,    // 接收到的他人消息
};

/**
 *  消息类型
 */
typedef NS_ENUM(NSInteger, TLMessageType){
    TLMessageTypeUnknown,       // 未知
    TLMessageTypeSystem,        // 系统
    TLMessageTypeText,          // 文字
    TLMessageTypeImage,         // 图片
    TLMessageTypeVoice,         // 语音
    TLMessageTypeVideo,         // 视频
    TLMessageTypeFile,          // 文件
    TLMessageTypeLocation,      // 位置
    TLMessageTypeShake,         // 抖动
};

/**
 *  消息发送状态
 */
typedef NS_ENUM(NSUInteger, TLMessageSendState){
    TLMessageSendSuccess,       // 消息发送成功
    TLMessageSendFail,          // 消息发送失败
};

/**
 *  消息读取状态
 */
typedef NS_ENUM(NSUInteger, TLMessageReadState) {
    TLMessageUnRead,            // 消息未读
    TLMessageReaded,            // 消息已读
};

@interface TLMessage : NSObject

@property (nonatomic, strong) TLUser *from;                         // 发送者信息
@property (nonatomic, strong) NSDate *date;                         // 发送时间
@property (nonatomic, strong) NSString *dateString;                 // 格式化的发送时间
@property (nonatomic, assign) TLMessageType messageType;            // 消息类型
@property (nonatomic, assign) TLMessageOwnerType ownerTyper;        // 发送者类型
@property (nonatomic, assign) TLMessageReadState readState;         // 读取状态
@property (nonatomic, assign) TLMessageSendState sendState;         // 发送状态

@property (nonatomic, assign) CGSize messageSize;                   // 消息大小
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) NSString *cellIndentify;

#pragma mark - 文字消息
@property (nonatomic, strong) NSString *text;                       // 文字信息
@property (nonatomic, strong) NSAttributedString *attrText;         // 格式化的文字信息

#pragma mark - 图片消息
@property (nonatomic, strong) NSString *imagePath;                  // 本地图片Path
@property (nonatomic, strong) UIImage *image;                       // 图片缓存
@property (nonatomic, strong) NSString *imageURL;                   // 网络图片URL

#pragma mark - 位置消息
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;    // 经纬度
@property (nonatomic, strong) NSString *address;                    // 地址

#pragma mark - 语音消息
@property (nonatomic, assign) NSUInteger voiceSeconds;              // 语音时间
@property (nonatomic, strong) NSString *voiceUrl;                   // 网络语音URL
@property (nonatomic, strong) NSString *voicePath;                  // 本地语音Path

@end
