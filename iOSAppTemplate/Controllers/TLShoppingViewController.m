//
//  TLShoppingViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/1.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLShoppingViewController.h"

@implementation TLShoppingViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Action_JD_mainMenu"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
    [self setUrlString:@"http://wq.jd.com"];
}

- (void) rightBarButtonDown
{

}

@end
