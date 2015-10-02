//
//  TLShakeMenuButton.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/2.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLShakeMenuButton.h"

@interface TLShakeMenuButton ()
{
    UIImageView *imageView;
    UILabel *titleLabel;
}

@end

@implementation TLShakeMenuButton

- (id) initWithFrame:(CGRect)frame
           imageName:(NSString *) imageName
         imageHLName:(NSString *) imageHLName
               title:(NSString *)title
              target:(id)target
              action:(SEL)action;
{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
        
        _image = [UIImage imageNamed:imageName];
        _imageHL = [UIImage imageNamed:imageHLName];
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 32)];
        [imageView setImage:_image];
        [self addSubview:imageView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 20, frame.size.width, 10)];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setText:title];
        [titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:titleLabel];
    }
    return self;
}

- (void) setChoosed:(BOOL)choosed
{
    if (choosed) {
        [imageView setImage:_imageHL];
        [titleLabel setTextColor:DEFAULT_GREEN_COLOR];
    }
    else {
        [imageView setImage:_image];
        [titleLabel setTextColor:[UIColor whiteColor]];
    }
}

@end
