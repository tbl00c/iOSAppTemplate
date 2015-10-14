//
//  TLShakeViewController.m
//  iOSAppTemplate
//
//  Created by libokun on 15/10/2.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLShakeViewController.h"
#import "TLShakeMenuButton.h"

#define     SHAKE_HEIGHT    90

@interface TLShakeViewController ()
{
    UIImageView *lineUpImageView;
    UIImageView *lineDownImageView;
}

@property (nonatomic, strong) UIView *upView;
@property (nonatomic, strong) UIView *downView;
@property (nonatomic, strong) UIImageView *centerView;

@property (nonatomic, strong) NSMutableArray *menuButtons;

@end

@implementation TLShakeViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"摇一摇"];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_set"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
    [self initSubViews];
}

- (void) rightBarButtonDown
{
    
}

- (void) menuButtonDown:(TLShakeMenuButton *) button
{
    for (TLShakeMenuButton *item in _menuButtons) {
        item == button ? [item setChoosed:YES] : [item setChoosed:NO];
    }
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ([lineUpImageView isHidden]) {
        [lineUpImageView setHidden:NO];
        [lineDownImageView setHidden:NO];
        [UIView animateWithDuration:0.5 animations:^{
            _upView.originY -= SHAKE_HEIGHT;
            _downView.originY += SHAKE_HEIGHT;
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.5 animations:^{
                    _upView.originY += SHAKE_HEIGHT;
                    _downView.originY -= SHAKE_HEIGHT;
                } completion:^(BOOL finished) {
                    [lineUpImageView setHidden:YES];
                    [lineDownImageView setHidden:YES];
                }];
            });
        }];
    }
}

- (void) initSubViews
{
    [self.view setBackgroundColor:[UIColor colorWithRed:42.0/255.0 green:45.0/255.0 blue:46.0/255.0 alpha:1.0]];
    
    float w = self.view.frameWidth;
    float h = self.view.frameHeight * 0.45;
    
    _centerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, h - w / 2.2, w, w)];
    [_centerView setImage:[UIImage imageNamed:@"ShakeHideImg_women"]];
    [self.view addSubview:_centerView];
    
    float logoW = self.view.frameWidth * 0.47;
    float logoH = logoW / 300 * 164;
    float lineH = 10;
    float x = (w - logoW) / 2.0;
    _upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    [self.view addSubview:_upView];
    UIImageView *logoUp = [[UIImageView alloc] initWithFrame:CGRectMake(x, h - logoH, logoW, logoH)];
    [logoUp setImage:[UIImage imageNamed:@"Shake_Logo_Up"]];
    [_upView addSubview:logoUp];
    lineUpImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, h - 3, w, lineH)];
    [lineUpImageView setImage:[UIImage imageNamed:@"Shake_Line_Up"]];
    [lineUpImageView setHidden:YES];
    [_upView addSubview:lineUpImageView];
    
    _downView = [[UIView alloc] initWithFrame:CGRectMake(0, h, w, self.view.frameHeight - h)];
    [self.view addSubview:_downView];
    UIImageView *logoDown = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, logoW, logoH)];
    [logoDown setImage:[UIImage imageNamed:@"Shake_Logo_Down"]];
    [_downView addSubview:logoDown];
    lineDownImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 3 - lineH, w, lineH)];
    [lineDownImageView setImage:[UIImage imageNamed:@"Shake_Line_Down"]];
    [lineDownImageView setHidden:YES];
    [_downView addSubview:lineDownImageView];
    
    w = WIDTH_SCREEN / 8.5;
    float space = (WIDTH_SCREEN - w * 3) / 3;
    h = w / 76 * 68 + 32;
    float y = HEIGHT_SCREEN - h - 5;
    x = space * 0.5;
    _menuButtons = [[NSMutableArray alloc] init];
    TLShakeMenuButton *peopleButton = [[TLShakeMenuButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                              imageName:@"Shake_icon_people"
                                                            imageHLName:@"Shake_icon_peopleHL"
                                                                  title:@"人"
                                                                 target:self
                                                                 action:@selector(menuButtonDown:)];
    peopleButton.tag = 0;
    [peopleButton setChoosed:YES];
    [_menuButtons addObject:peopleButton];
    [self.view addSubview:peopleButton];
    x += w + space;
    TLShakeMenuButton *songButton = [[TLShakeMenuButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                               imageName:@"Shake_icon_music"
                                                             imageHLName:@"Shake_icon_musicHL"
                                                                   title:@"歌曲"
                                                                  target:self
                                                                  action:@selector(menuButtonDown:)];
    songButton.tag = 1;
    [_menuButtons addObject:songButton];
    [self.view addSubview:songButton];
    x += w + space;
    TLShakeMenuButton *tvButton = [[TLShakeMenuButton alloc] initWithFrame:CGRectMake(x, y, w, h)
                                                             imageName:@"Shake_icon_tv"
                                                           imageHLName:@"Shake_icon_tvHL"
                                                                 title:@"电视"
                                                                target:self
                                                                action:@selector(menuButtonDown:)];
    tvButton.tag = 2;
    [_menuButtons addObject:tvButton];
    [self.view addSubview:tvButton];
}

@end
