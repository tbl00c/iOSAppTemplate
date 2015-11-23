//
//  enumerate.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#ifndef iOSAppTemplate_enumerate_h
#define iOSAppTemplate_enumerate_h
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TLSettingItemAlignment) {
    TLSettingItemAlignmentLeft,
    TLSettingItemAlignmentRight,
    TLSettingItemAlignmentMiddle,
};


typedef NS_ENUM(NSInteger, TLSettingItemType) {
    TLSettingItemTypeDefault,       // image, title, rightTitle, rightImage
    TLSettingItemTypeButton,        // button
    TLSettingItemTypeAvatar,        // title, avatar
    TLSettingItemTypeSwitch,        // title， Switch
};


#endif
