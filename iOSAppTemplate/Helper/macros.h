//
//  macros.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#ifndef iOSAppTemplate_macros_h
#define iOSAppTemplate_macros_h

#define APPDELEGETE 	((AppDelegate*)[[UIApplication sharedApplication] delegate])

#pragma mark - Frame
#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN       [UIScreen mainScreen].bounds.size.height
#define HEIGHT_STATUSBAR	20
#define HEIGHT_TABBAR       49
#define HEIGHT_NAVBAR       44

#pragma mark - Color
#define     DEFAULT_NAVBAR_COLOR            [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:0.9]
#define     DEFAULT_BACKGROUND_COLOR        [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:246.0/255.0 alpha:1.0]
#define     DEFAULT_SEARCHBAR_COLOR         [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0]
#define     DEFAULT_GREEN_COLOR             [UIColor colorWithRed:2.0/255 green:187.0/255  blue:0.0/255 alpha:1.0f]
#define     DEFAULT_TEXT_GRAY_COLOR         [UIColor grayColor]
#define     DEFAULT_LINE_GRAY_COLOR         [UIColor colorWithRed:188.0/255 green:188.0/255  blue:188.0/255 alpha:0.6f]

#endif
