//
//  TLRootViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/13.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLRootViewController.h"

#import "TLNavigationController.h"
#import "TLFirstViewController.h"
#import "TLSecondViewController.h"


@interface TLRootViewController ()

@end

@implementation TLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void) initChildViewControllers
{
    NSMutableArray *childVCArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    TLFirstViewController *firstVC = [[TLFirstViewController alloc] init];
    [firstVC.tabBarItem setTitle:@"first"];
    TLNavigationController *firstNavC = [[TLNavigationController alloc] initWithRootViewController:firstVC];
    [childVCArray addObject:firstNavC];
    
    TLSecondViewController *secondVC = [[TLSecondViewController alloc] init];
    [self.tabBarItem setTitle:@"second"];
    TLNavigationController *secondNavC = [[TLNavigationController alloc] initWithRootViewController:secondVC];
    [childVCArray addObject:secondNavC];
    
    [self setViewControllers:childVCArray];
}

@end
