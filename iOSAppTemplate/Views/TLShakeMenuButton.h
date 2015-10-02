//
//  TLShakeMenuButton.h
//  iOSAppTemplate
//
//  Created by libokun on 15/10/2.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLShakeMenuButton : UIButton

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *imageHL;

- (id) initWithFrame:(CGRect)frame
           imageName:(NSString *) imageName
         imageHLName:(NSString *) imageHLName
               title:(NSString *)title
              target:(id)target
              action:(SEL)action;
- (void) setChoosed:(BOOL)choosed;

@end
