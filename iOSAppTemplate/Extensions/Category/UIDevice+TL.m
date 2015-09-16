//
//  UIDevice+PVZ.m
//  PlantsVsZombies
//
//  Created by h1r0 on 15/8/29.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "UIDevice+TL.h"

@implementation UIDevice (TL)

+ (DeviceVerType)deviceVerType{
    if (WIDTH_SCREEN == 375) {
        return DeviceVer6;
    }else if (WIDTH_SCREEN == 414){
        return DeviceVer6P;
    }else if(HEIGHT_SCREEN == 480){
        return DeviceVer4;
    }else if (HEIGHT_SCREEN == 568){
        return DeviceVer5;
    }
    return DeviceVer4;
}

@end
