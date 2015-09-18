//
//  TLButtonCell.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/18.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "CommonTableViewCell.h"

@interface TLButtonCell : CommonTableViewCell

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) NSString *buttonTitle;
@property (nonatomic, assign) UIColor *buttonTitleColor;
@property (nonatomic, assign) UIColor *buttonBackgroundGColor;

- (void) addTarget:(id)target action:(SEL)action;

@end
