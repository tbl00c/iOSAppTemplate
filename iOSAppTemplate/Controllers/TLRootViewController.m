//
//  TLRootViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/13.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLRootViewController.h"

#import "TLNavigationController.h"
#import "TLConversationViewController.h"
#import "TLFriendsViewController.h"

@interface TLRootViewController ()

@end

@implementation TLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:DEFAULT_GREEN_COLOR];
    [self.tabBar setTranslucent:NO];
    
    [self initChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) initChildViewControllers
{
    NSMutableArray *childVCArray = [[NSMutableArray alloc] initWithCapacity:5];

    TLConversationViewController *conversationVC = [[TLConversationViewController alloc] init];
    [conversationVC.tabBarItem setTitle:@"消息"];
    [conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    TLNavigationController *convNavC = [[TLNavigationController alloc] initWithRootViewController:conversationVC];
    [childVCArray addObject:convNavC];
    
    TLFriendsViewController *friendsVC = [[TLFriendsViewController alloc] init];
    [friendsVC.tabBarItem setTitle:@"通讯录"];
    [friendsVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    TLNavigationController *friendNavC = [[TLNavigationController alloc] initWithRootViewController:friendsVC];
    [childVCArray addObject:friendNavC];
    
    UIViewController *discoverVC = [[UIViewController alloc] init];
    [discoverVC.tabBarItem setTitle:@"发现"];
    [discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    TLNavigationController *discoverNavC = [[TLNavigationController alloc] initWithRootViewController:discoverVC];
    [childVCArray addObject:discoverNavC];
    
    UIViewController *mineVC = [[UIViewController alloc] init];
    [mineVC.tabBarItem setTitle:@"发现"];
    [mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_meHL"]];
    TLNavigationController *mineNavC = [[TLNavigationController alloc] initWithRootViewController:mineVC];
    [childVCArray addObject:mineNavC];
    
    [self setViewControllers:childVCArray];
}

@end
