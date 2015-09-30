//
//  TLUIHelper.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLSetting.h"

@interface TLUIHelper : NSObject

+ (TLSettingGrounp *) getFriensListItemsGroup;
+ (NSMutableArray *) getDiscoverItems;
+ (NSMutableArray *) getMineVCItems;
+ (NSMutableArray *) getDetailVCItems;
+ (NSMutableArray *) getDetailSettingVCItems;
+ (NSMutableArray *) getMineDetailVCItems;

+ (NSMutableArray *) getSettingVCItems;
+ (NSMutableArray *) getNewNotiVCItems;


@end
