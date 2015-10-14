//
//  TLFriendSearchViewController.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/16.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "CommonTableViewController.h"

@interface TLFriendSearchViewController : CommonTableViewController <UISearchResultsUpdating>

@property (nonatomic, copy) NSMutableArray *friendsArray;

@end
