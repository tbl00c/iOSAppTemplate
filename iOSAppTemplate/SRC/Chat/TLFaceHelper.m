//
//  TLFaceHelper.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import "TLFaceHelper.h"

static TLFaceHelper *faceHelper = nil;

@implementation TLFaceHelper

+ (TLFaceHelper *) sharedFaceHelper
{
    if (faceHelper == nil) {
        faceHelper = [[TLFaceHelper alloc] init];
    }
    return faceHelper;
}

#pragma mark - Public Methods
- (NSArray *) getFaceArrayByGroupID:(NSString *)groupID
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:groupID ofType:@"plist"]];
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *dic in array) {
        TLFace *face = [[TLFace alloc] init];
        face.faceID = [dic objectForKey:@"face_id"];
        face.faceName = [dic objectForKey:@"face_name"];
        [data addObject:face];
     }
  
    return data;
}

#pragma mark - Getter
- (NSMutableArray *) faceGroupArray
{
    if (_faceGroupArray == nil) {
        _faceGroupArray = [[NSMutableArray alloc] init];
        
        TLFaceGroup *group = [[TLFaceGroup alloc] init];
        group.faceType = TLFaceTypeEmoji;
        group.groupID = @"normal_face";
        group.groupImageName = @"EmotionsEmojiHL";
        group.facesArray = nil;
        [_faceGroupArray addObject:group];
    }
    return _faceGroupArray;
}

@end
