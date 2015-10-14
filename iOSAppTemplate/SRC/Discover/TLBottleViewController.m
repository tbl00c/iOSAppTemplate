//
//  TLBottleViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/1.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLBottleViewController.h"
#import "TLBottleButton.h"

@interface TLBottleViewController ()
{
    NSTimer *timer;
    UITapGestureRecognizer *tap;
}

@property (nonatomic, strong) UIView *bgView;

@end

@implementation TLBottleViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"漂流瓶"];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_set"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
    [self initSubViews];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(tryHiddenNavBar) userInfo:nil repeats:NO];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView)];
    [self.view addGestureRecognizer:tap];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self hiddenNavBar:NO];
    [timer invalidate];
    [self.view removeGestureRecognizer:tap];
}

- (void) tryHiddenNavBar
{
    [timer invalidate];
    [self hiddenNavBar:YES];
}

- (void) didTapView
{
    [timer invalidate];
    [self hiddenNavBar:![self.navigationController.navigationBar isHidden]];
}

- (void) hiddenNavBar:(BOOL)hidden
{
    if (hidden) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
        [UIView animateWithDuration:0.5 animations:^{
            [self.navigationController.navigationBar setOriginY: -HEIGHT_NAVBAR - HEIGHT_STATUSBAR];
        } completion:^(BOOL finished) {
            [self.navigationController.navigationBar setHidden:YES];
        }];
    }
    else {
        [self.navigationController.navigationBar setHidden:NO];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        [UIView animateWithDuration:0.2 animations:^{
            [self.navigationController.navigationBar setOriginY:HEIGHT_STATUSBAR];
        }];
    }
}

- (void) rightBarButtonDown
{
    
}

- (void) bottleButtonDown:(TLBottleButton *)sender
{

}

- (void) initSubViews
{
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];
    [self.view addSubview:_bgView];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:_bgView.frame];
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    int hour = [dateFormatter stringFromDate:date].intValue;
    if (hour >= 6 && hour <= 18) {
        [bgImageView setImage:[UIImage imageNamed:@"bottleBkg.jpg"]];
    }
    else {
        [bgImageView setImage:[UIImage imageNamed:@"bottleNightBkg.jpg"]];
    }
    [_bgView addSubview:bgImageView];
    
    float h = WIDTH_SCREEN / 640 * 92;
    UIImageView *bottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottleBoard"]];
    [bottomImageView setFrame:CGRectMake(0, HEIGHT_SCREEN - h, WIDTH_SCREEN, h)];
    [_bgView addSubview:bottomImageView];
    
    float w = WIDTH_SCREEN / 4;
    float space = (WIDTH_SCREEN - w * 3) / 4;
    h = w / 152 * 172 + 10;
    float y = HEIGHT_SCREEN - h;
    float x = space;
    TLBottleButton *throwButton = [[TLBottleButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                              imageName:@"bottleButtonThrow"
                                                                  title:@"扔一个"
                                                                 target:self
                                                                 action:@selector(bottleButtonDown:)];
    throwButton.tag = 1;
    [_bgView addSubview:throwButton];

    x += w + space;
    TLBottleButton *gatherButton = [[TLBottleButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                               imageName:@"bottleButtonFish"
                                                                   title:@"捡一个"
                                                                  target:self
                                                                  action:@selector(bottleButtonDown:)];
    gatherButton.tag = 2;
    [_bgView addSubview:gatherButton];

    
    x += w + space;
    TLBottleButton *mineButton = [[TLBottleButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                             imageName:@"bottleButtonMine"
                                                                 title:@"我的瓶子"
                                                                target:self
                                                                action:@selector(bottleButtonDown:)];
    mineButton.tag = 3;
    [_bgView addSubview:mineButton];

}

@end
