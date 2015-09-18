//
//  TLFounctionCell.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/18.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "CommonTableViewCell.h"

@interface TLDetailFounctionCell : CommonTableViewCell

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSString *beforeSubImage;
@property (nonatomic, strong) NSString *afterSubImage;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@end
