//
//  TLSetting.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLSettingItem : NSObject

@property (nonatomic, assign) TLSettingItemType type;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSString *subImageName;
@property (nonatomic, strong) NSMutableArray *subImages;
@property (nonatomic, strong) NSURL *subImageURL;

- (id) initWithTitle:(NSString *)title;
- (id) initWithTitle:(NSString *)title subImageName:(NSString *)subImageName;
- (id) initWithTitle:(NSString *)title subImages:(NSMutableArray *)subImages;
- (id) initWithTitle:(NSString *)title type:(TLSettingItemType)type;
- (id) initWithTitle:(NSString *)title imageName:(NSString *)imageName;
- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle type:(TLSettingItemType)type;
- (id) initWithTitle:(NSString *)title subImageName:(NSString *)subImageName type:(TLSettingItemType)type;

- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageName:(NSString *)subImageName;
- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageName:(NSString *)subImageName type:(TLSettingItemType)type;
- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageURL:(NSURL *)subImageURL type:(TLSettingItemType)type;

@end

@interface TLSettingGrounp : NSObject

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign) NSUInteger itemsCount;

- (id) initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(TLSettingItem *)firstObj, ...;

- (TLSettingItem *) itemAtIndex:(NSUInteger)index;

@end

