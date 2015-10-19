//
//  TLChatBoxMoreItem.h
//  iOSAppTemplate
//
//  Created by libokun on 15/10/17.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLChatBoxMoreItem : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *imageHLName;

+ (TLChatBoxMoreItem *) createChatBoxMoreItemWithTitle:(NSString *)title
                                             imageName:(NSString *)imageName
                                           imageHLName:(NSString *)imageHLName;

@end
