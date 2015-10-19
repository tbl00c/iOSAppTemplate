//
//  TLFaceHelper.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLFace.h"

@interface TLFaceHelper : NSObject

@property (nonatomic, strong) NSMutableArray *faceGroupArray;

+ (TLFaceHelper *) sharedFaceHelper;

- (NSArray *) getFaceArrayByGroupID:(NSString *)groupID;

@end
