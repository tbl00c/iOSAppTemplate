//
//  TLExpressionViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/1.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLExpressionViewController.h"

@implementation TLExpressionViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"精选表情", @"投稿表情"]];
    [segmentedControl setFrameWidth:WIDTH_SCREEN * 0.6];
    [segmentedControl setSelectedSegmentIndex:0];
    [segmentedControl addTarget:self action:@selector(segmentedControlChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.navigationItem setTitleView:segmentedControl];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_set"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

- (void) rightBarButtonDown
{

}

- (void) segmentedControlChanged:(UISegmentedControl *)segmentedControl
{

}

@end
