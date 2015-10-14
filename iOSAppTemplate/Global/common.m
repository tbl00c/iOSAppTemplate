//
//  common.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "common.h"

@implementation common

void WBLogError(NSString *className, NSString *funcName, NSError *error)
{
    NSLog(@"ERROR\nClass: %@\nFunc: %@\nInfo: %@", className, funcName, error);
}

void WBLogWarning(id className, id funcName, NSString *format,...)
{
    va_list args;
    va_start(args, format);
    NSString * str = [[NSString alloc] initWithFormat:format arguments:args];
    NSLog(@"WARNING\nClass: %@\nFunc: %@\nInfo: %@", className, funcName, str);
    va_end(args);
}

@end
