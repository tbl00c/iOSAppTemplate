//
//  TLViewHeadFlooterView.h
//  iOSAppTemplate
//
//  Created by libokun on 15/9/30.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLTableHeadFooterView : UITableViewHeaderFooterView

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) UITextView *textView;

+ (CGFloat) heightForTextToFitView:(NSString *)text;

@end
