//
//  UIImage+WB.m
//  WhichBank
//
//  Created by h1r0 on 15/9/6.
//  Copyright (c) 2015年 lettai. All rights reserved.
//

#import "UIImage+TL.h"

@implementation UIImage (TL)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
