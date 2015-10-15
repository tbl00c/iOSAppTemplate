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

@property (nonatomic, strong) TLConversationViewController *conversationVC;
@property (nonatomic, strong) TLFriendsViewController *friendsVC;
@property (nonatomic, strong) TLDiscoverViewController *discoverVC;
@property (nonatomic, strong) TLMineViewController *mineVC;

@end

@implementation TLRootViewController

#pragma mark - LifeCycle

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:DEFAULT_GREEN_COLOR];
    

    TLNavigationController *convNavC = [[TLNavigationController alloc] initWithRootViewController:self.conversationVC];
    TLNavigationController *friendNavC = [[TLNavigationController alloc] initWithRootViewController:self.friendsVC];
    TLNavigationController *discoverNavC = [[TLNavigationController alloc] initWithRootViewController:self.discoverVC];
    TLNavigationController *mineNavC = [[TLNavigationController alloc] initWithRootViewController:self.mineVC];
    [self setViewControllers:@[convNavC, friendNavC, discoverNavC, mineNavC]];
}

#pragma mark - Getter and Setter
/**
 *  消息
 */
- (TLConversationViewController *) conversationVC
{
    if (_conversationVC == nil) {
        _conversationVC = [[TLConversationViewController alloc] init];
        [_conversationVC.tabBarItem setTitle:@"消息"];
        [_conversationVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
        [_conversationVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    }
    return _conversationVC;
}

/**
 *  通讯录
 */
- (TLFriendsViewController *) friendsVC
{
    if (_friendsVC == nil) {
        _friendsVC = [[TLFriendsViewController alloc] init];
        [_friendsVC.tabBarItem setTitle:@"通讯录"];
        [_friendsVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
        [_friendsVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    }
    return _friendsVC;
}

/**
 *  发现
 */
- (TLDiscoverViewController *) discoverVC
{
    if (_discoverVC == nil) {
        _discoverVC = [[TLDiscoverViewController alloc] init];
        [_discoverVC.tabBarItem setTitle:@"发现"];
        [_discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
        [_discoverVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    }
    return _discoverVC;
}

/**
 *  我
 */
- (TLMineViewController *) mineVC
{
    if (_mineVC == nil) {
        _mineVC = [[TLMineViewController alloc] init];
        [_mineVC.tabBarItem setTitle:@"我"];
        [_mineVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
        [_mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    }
    return _mineVC;
}

@end
