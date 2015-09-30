//
//  TLFounctionCell.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/18.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "TLSetting.h"

@interface TLFounctionCell : CommonTableViewCell

// 一般Type
@property (nonatomic, strong) TLSettingItem *item;
@property (nonatomic, assign) CGFloat titleFontSize;
@property (nonatomic, assign) CGFloat subTitleFontSize;
@property (nonatomic, assign) UIColor* subTitleFontColor;

// buttonType 用
@property (nonatomic, assign) UIColor *buttonTitleColor;
@property (nonatomic, assign) UIColor *buttonBackgroundGColor;

- (void) addTarget:(id)target action:(SEL)action;

@end
