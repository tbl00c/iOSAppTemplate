//
//  TLSetting.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLSetting.h"

@implementation TLSettingItem

- (id) initWithTitle:(NSString *)title
{
    return [self initWithTitle:title subTitle:nil imageName:nil subImageName:nil type:TLSettingItemTypeDefault];
}

- (id) initWithTitle:(NSString *)title subImageName:(NSString *)subImageName
{
return [self initWithTitle:title subTitle:nil imageName:nil subImageName:subImageName type:TLSettingItemTypeDefault];
}

- (id) initWithTitle:(NSString *)title type:(TLSettingItemType)type
{
    return [self initWithTitle:title subTitle:nil imageName:nil subImageName:nil type:type];
}

- (id) initWithTitle:(NSString *)title subImages:(NSMutableArray *)subImages
{
    _subImages = subImages;
    return [self initWithTitle:title type:TLSettingItemTypeLeft];
}

- (id) initWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    return [self initWithTitle:title subTitle:nil imageName:imageName subImageName:nil type:TLSettingItemTypeDefault];
}

- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    return [self initWithTitle:title subTitle:subTitle imageName:nil subImageName:nil type:TLSettingItemTypeDefault];
}

- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle type:(TLSettingItemType)type
{
    return [self initWithTitle:title subTitle:subTitle imageName:nil subImageName:nil type:type];
}

- (id) initWithTitle:(NSString *)title subImageName:(NSString *)subImageName type:(TLSettingItemType)type
{
    return [self initWithTitle:title subTitle:nil imageName:nil subImageName:subImageName type:type];
}

- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageName:(NSString *)subImageName
{
    return [self initWithTitle:title subTitle:subTitle imageName:imageName subImageName:subImageName type:TLSettingItemTypeDefault];
}

- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageName:(NSString *)subImageName type:(TLSettingItemType)type
{
    if (self = [super init]) {
        _title = title;
        _subTitle = subTitle;
        _imageName = imageName;
        _subImageName = subImageName;
        _subImageURL = nil;
        _type = type;
    }
    return self;
}

- (id) initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageURL:(NSURL *)subImageURL type:(TLSettingItemType)type
{
    if (self = [super init]) {
        _title = title;
        _subTitle = subTitle;
        _imageName = imageName;
        _subImageName = nil;
        _subImageURL = subImageURL;
        _type = type;
    }
    return self;
}

@end


@implementation TLSettingGrounp

- (id) initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(TLSettingItem *)firstObj, ...
{
    if (self = [super init]) {
        _headerTitle = headerTitle;
        _footerTitle = footerTitle;
        _items = [[NSMutableArray alloc] init];
        va_list argList;
        if (firstObj) {
            [_items addObject:firstObj];
            va_start(argList, firstObj);
            id arg;
            while ((arg = va_arg(argList, id))) {
                [_items addObject:arg];
            }
            va_end(argList);
        }
    }
    return self;
}

- (TLSettingItem *) itemAtIndex:(NSUInteger)index
{
    return [_items objectAtIndex:index];
}

- (NSUInteger) itemsCount
{
    return _itemsCount = _items.count;
}

@end