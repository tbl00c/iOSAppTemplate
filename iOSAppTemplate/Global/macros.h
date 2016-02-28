//
//  macros.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#ifndef iOSAppTemplate_macros_h
#define iOSAppTemplate_macros_h

#define APPDELEGETE         ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define WBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

#pragma mark - Frame
#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN       [UIScreen mainScreen].bounds.size.height
#define HEIGHT_STATUSBAR	20
#define HEIGHT_TABBAR       49
#define HEIGHT_NAVBAR       44
#define HEIGHT_CHATBOXVIEW  215

#pragma mark - Color
#define     DEFAULT_NAVBAR_COLOR             WBColor(20.0, 20.0, 20.0, 0.9)
#define     DEFAULT_BACKGROUND_COLOR         WBColor(239.0, 239.0, 244.0, 1.0)

#define     DEFAULT_CHAT_BACKGROUND_COLOR    WBColor(235.0, 235.0, 235.0, 1.0)
#define     DEFAULT_CHATBOX_COLOR            WBColor(244.0, 244.0, 246.0, 1.0)
#define     DEFAULT_SEARCHBAR_COLOR          WBColor(239.0, 239.0, 244.0, 1.0)
#define     DEFAULT_GREEN_COLOR              WBColor(2.0, 187.0, 0.0, 1.0f)
#define     DEFAULT_TEXT_GRAY_COLOR         [UIColor grayColor]
#define     DEFAULT_LINE_GRAY_COLOR          WBColor(188.0, 188.0, 188.0, 0.6f)

#pragma mark - Path
#define     PATH_DOCUMENT                   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define     PATH_CHATREC_IMAGE              [PATH_DOCUMENT stringByAppendingPathComponent:@"ChatRec/Images"]

#define mark - Key
#define UMENG_KEY   @"56d2b08c67e58e2f54000b07"

#endif
