//
//  TLFriendsViewController.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "CommonTableViewController.h"

@interface TLFriendsViewController : CommonTableViewController

@property (nonatomic, strong) NSMutableArray *friendsArray;     // 好友列表数据
@property (nonatomic, strong) NSMutableArray *data;             // 格式化的好友列表数据
@property (nonatomic, strong) NSMutableArray *section;          // 拼音首字母列表

@end