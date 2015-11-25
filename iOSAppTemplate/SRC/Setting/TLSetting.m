//
//  TLSetting.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLSetting.h"

@implementation TLSettingItem

- (id) init
{
    if (self = [super init]) {
        self.alignment = TLSettingItemAlignmentRight;
        
        self.bgColor = [UIColor whiteColor];
        self.titleColor = [UIColor blackColor];
        self.titleFont = [UIFont systemFontOfSize:15.5f];
        self.subTitleColor = [UIColor grayColor];
        self.subTitleFont = [UIFont systemFontOfSize:15.0f];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.rightImageHeightOfCell = 0.72;
        self.middleImageHeightOfCell = 0.35;
    }
    return self;
}

+ (TLSettingItem *) createWithTitle:(NSString *)title
{
    return [TLSettingItem createWithImageName:nil title:title];
}

+ (TLSettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title
{
    return [TLSettingItem createWithImageName:imageName title:title subTitle:nil rightImageName:nil];
}

+ (TLSettingItem *) createWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    return [TLSettingItem createWithImageName:nil title:title subTitle:subTitle rightImageName:nil];
}

+ (TLSettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle
{
    return [TLSettingItem createWithImageName:imageName title:title middleImageName:middleImageName subTitle:subTitle rightImageName:nil];
}

+ (TLSettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName
{
    return [TLSettingItem createWithImageName:imageName title:title middleImageName:nil subTitle:subTitle rightImageName:rightImageName];
}

+ (TLSettingItem *) createWithImageName:(NSString *)imageName title:(NSString *)title middleImageName:(NSString *)middleImageName subTitle:(NSString *)subTitle rightImageName:(NSString *)rightImageName
{
    TLSettingItem *item = [[TLSettingItem alloc] init];
    item.imageName = imageName;
    item.middleImageName = middleImageName;
    item.rightImageName = rightImageName;
    item.title = title;
    item.subTitle = subTitle;
    return item;
}

- (void) setAlignment:(TLSettingItemAlignment)alignment
{
    _alignment = alignment;
    if (alignment == TLSettingItemAlignmentMiddle) {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void) setType:(TLSettingItemType)type
{
    _type = type;
    if (type == TLSettingItemTypeSwitch) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else if (type == TLSettingItemTypeButton) {
        self.btnBGColor = DEFAULT_GREEN_COLOR;
        self.btnTitleColor = [UIColor whiteColor];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.bgColor = [UIColor clearColor];
    }
}

@end


@implementation TLSettingGrounp

- (id) initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(TLSettingItem *)firstObj, ...
{
    if (self = [super init]) {
        _headerTitle = headerTitle;
        _footerTitle = footerTitle;
        _items = [[NSMutableArray alloc] init];
        va_list argList;
        if (firstObj) {
            [_items addObject:firstObj];
            va_start(argList, firstObj);
            id arg;
            while ((arg = va_arg(argList, id))) {
                [_items addObject:arg];
            }
            va_end(argList);
        }
    }
    return self;
}

- (TLSettingItem *) itemAtIndex:(NSUInteger)index
{
    return [_items objectAtIndex:index];
}

- (NSUInteger) indexOfItem:(TLSettingItem *)item
{
    return [_items indexOfObject:item];
}

- (NSUInteger) itemsCount
{
    return self.items.count;
}

@end