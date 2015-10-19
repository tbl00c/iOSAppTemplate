//
//  TLFace.h
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/10/19.
//  Copyright © 2015年 lbk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TLFaceType) {
    TLFaceTypeEmoji,
    TLFaceTypeGIF,
};

@interface TLFace : NSObject

@property (nonatomic, assign) TLFaceType faceType;
@property (nonatomic, strong) NSString *faceID;
@property (nonatomic, strong) NSString *faceImageName;

@end

@interface TLFaceGroup : NSObject

@property (nonatomic, strong) NSString *faceGroupTitle;
@property (nonatomic, strong) NSMutableArray *facesArray;

@end
