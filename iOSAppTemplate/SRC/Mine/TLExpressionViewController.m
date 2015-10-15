//
//  TLExpressionViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/1.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLExpressionViewController.h"

@interface TLExpressionViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@end

@implementation TLExpressionViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitleView:self.segmentedControl];
    [self.navigationItem setRightBarButtonItem:self.rightBarButtonItem];
}

#pragma mark - Event Response
- (void) rightBarButtonDown
{

}

- (void) segmentedControlChanged:(UISegmentedControl *)segmentedControl
{

}

#pragma mark - Getter and Setter 
- (UISegmentedControl *) segmentedControl
{
    if (_segmentedControl == nil) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"精选表情", @"投稿表情"]];
        [_segmentedControl setFrameWidth:WIDTH_SCREEN * 0.6];
        [_segmentedControl setSelectedSegmentIndex:0];
        [_segmentedControl addTarget:self action:@selector(segmentedControlChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _segmentedControl;
}

- (UIBarButtonItem *)rightBarButtonItem
{
    if (_rightBarButtonItem == nil) {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_set"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    }
    return _rightBarButtonItem;
}

@end
