//
//  TLUserDetailCell.h
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/18.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "TLUser.h"

typedef NS_ENUM(NSInteger, UserDetailCellType) {
    UserDetailCellTypeFriends,
    UserDetailCellTypeMine,
};

@interface TLUserDetailCell : CommonTableViewCell

@property (nonatomic, assign) UserDetailCellType cellType;

@property (nonatomic, strong) TLUser *user;

@end
