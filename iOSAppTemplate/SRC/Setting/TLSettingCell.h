//
//  TLSettingCell.h
//  iOSAppTemplate
//
//  Created by libokun on 15/11/22.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "TLSetting.h"

@interface TLSettingCell : CommonTableViewCell

@property (nonatomic, strong) TLSettingItem *item;

+ (CGFloat) getHeightForText:(TLSettingItem *)item;

@end
