//
//  TLUser.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLUser : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *nikename;
@property (nonatomic, strong) NSURL *avatarURL;
@property (nonatomic, strong) NSString *motto;
@property (nonatomic, strong) NSString *phoneNumber;

@property (nonatomic, strong) NSString *pinyin;
@property (nonatomic, strong) NSString *initial;


@end
