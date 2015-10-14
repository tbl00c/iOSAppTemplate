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
#import "TLDiscoverViewController.h"
#import "TLMineViewController.h"

@interface TLRootViewController ()

@end

@implementation TLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:DEFAULT_GREEN_COLOR];
    
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
    [conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
    [conversationVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    TLNavigationController *convNavC = [[TLNavigationController alloc] initWithRootViewController:conversationVC];
    [childVCArray addObject:convNavC];
    
    TLFriendsViewController *friendsVC = [[TLFriendsViewController alloc] init];
    [friendsVC.tabBarItem setTitle:@"通讯录"];
    [friendsVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
    [friendsVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    TLNavigationController *friendNavC = [[TLNavigationController alloc] initWithRootViewController:friendsVC];
    [childVCArray addObject:friendNavC];
    
    TLDiscoverViewController *discoverVC = [[TLDiscoverViewController alloc] init];
    [discoverVC.tabBarItem setTitle:@"发现"];
    [discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
    [discoverVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    TLNavigationController *discoverNavC = [[TLNavigationController alloc] initWithRootViewController:discoverVC];
    [childVCArray addObject:discoverNavC];
    
    TLMineViewController *mineVC = [[TLMineViewController alloc] init];
    [mineVC.tabBarItem setTitle:@"我"];
    [mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
    [mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    TLNavigationController *mineNavC = [[TLNavigationController alloc] initWithRootViewController:mineVC];
    [childVCArray addObject:mineNavC];
    
    [self setViewControllers:childVCArray];
}

@end
