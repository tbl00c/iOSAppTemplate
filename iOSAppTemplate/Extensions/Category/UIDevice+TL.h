//
//  UIDevice+PVZ.h
//  PlantsVsZombies
//
//  Created by h1r0 on 15/8/29.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DeviceVerType){
    DeviceVer4,
    DeviceVer5,
    DeviceVer6,
    DeviceVer6P,
};

@interface UIDevice (TL)

+ (DeviceVerType)deviceVerType;

@end
