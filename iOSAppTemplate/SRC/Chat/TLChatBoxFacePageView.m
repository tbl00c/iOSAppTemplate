//
//  TLChatBoxFacePageView.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/20.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLChatBoxFacePageView.h"

@interface TLChatBoxFacePageView ()

@property (nonatomic, strong) UIButton *delButton;
@property (nonatomic, strong) NSMutableArray *faceViewArray;

@end

@implementation TLChatBoxFacePageView

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.delButton];
    }
    return self;
}

#pragma mark - Public Methods
- (void) showFaceGroup:(TLFaceGroup *)group formIndex:(int)fromIndex count:(int)count
{
    int index = 0;
    float spaceX = 12;
    float spaceY = 10;
    int row = (group.faceType == TLFaceTypeEmoji ? 3 : 2);
    int col = (group.faceType == TLFaceTypeEmoji ? 7 : 4);
    float w = (WIDTH_SCREEN - spaceX * 2) / col;
    float h = (self.frameHeight - spaceY * (row - 1)) / row;
    float x = spaceX;
    float y = spaceY;
    for (int i = fromIndex; i < fromIndex + count; i ++) {
        UIButton *button;
        if (index < self.faceViewArray.count) {
            button = [self.faceViewArray objectAtIndex:index];
        }
        else {
            button = [[UIButton alloc] init];
            [button addTarget:_target action:_action forControlEvents:_controlEvents];
            [self addSubview:button];
            [self.faceViewArray addObject:button];
        }
        index ++;
        
        if (i >= group.facesArray.count || i < 0) {
            [button setHidden:YES];
        }
        else {
            TLFace *face = [group.facesArray objectAtIndex:i];
            button.tag = i;
            [button setImage:[UIImage imageNamed:face.faceName] forState:UIControlStateNormal];
            [button setFrame:CGRectMake(x, y, w, h)];
            [button setHidden:NO];
            x = (index % col == 0 ? spaceX: x + w);
            y = (index % col == 0 ? y + h : y);
        }
    }
    [_delButton setHidden:fromIndex >= group.facesArray.count];
    [_delButton setFrame:CGRectMake(x, y, w, h)];
}

- (void) addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    _target = target;
    _action = action;
    _controlEvents = controlEvents;
    [self.delButton addTarget:_target action:_action forControlEvents:_controlEvents];
    for (UIButton *button in self.faceViewArray) {
        [button addTarget:target action:action forControlEvents:controlEvents];
    }
}

#pragma mark - Getter
- (NSMutableArray *) faceViewArray
{
    if (_faceViewArray == nil) {
        _faceViewArray = [[NSMutableArray alloc] init];
    }
    return _faceViewArray;
}

- (UIButton *) delButton
{
    if (_delButton == nil) {
        _delButton = [[UIButton alloc] init];
        _delButton.tag = -1;
        [_delButton setImage:[UIImage imageNamed:@"DeleteEmoticonBtn"] forState:UIControlStateNormal];
    }
    return _delButton;
}


@end
