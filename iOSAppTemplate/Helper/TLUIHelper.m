//
//  TLUIHelper.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLUIHelper.h"

@implementation TLUIHelper

+ (TLSettingGrounp *) getFriensListItemsGroup
{
    TLSettingItem *notify = [[TLSettingItem alloc] initWithTitle:@"新的朋友" imageName:@"plugins_FriendNotify"];
    TLSettingItem *friendGroup = [[TLSettingItem alloc] initWithTitle:@"群聊" imageName:@"add_friend_icon_addgroup"];
    TLSettingItem *tag = [[TLSettingItem alloc] initWithTitle:@"标签" imageName:@"Contact_icon_ContactTag"];
    TLSettingItem *offical = [[TLSettingItem alloc] initWithTitle:@"公众号" imageName:@"add_friend_icon_offical"];
    TLSettingGrounp *group = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:notify, friendGroup, tag, offical, nil];
    return group;
}

+ (NSMutableArray *) getMineVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *album = [[TLSettingItem alloc] initWithTitle:@"相册" imageName:@"MoreMyAlbum"];
    TLSettingItem *favorite = [[TLSettingItem alloc] initWithTitle:@"收藏" imageName:@"MoreMyFavorites"];
    TLSettingItem *bank = [[TLSettingItem alloc] initWithTitle:@"钱包" imageName:@"MoreMyBankCard"];
    TLSettingItem *expression = [[TLSettingItem alloc] initWithTitle:@"表情" imageName:@"MoreExpressionShops"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, expression, nil];
    [items addObject:group1];
    
    TLSettingItem *setting = [[TLSettingItem alloc] initWithTitle:@"设置" imageName:@"MoreSetting"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:setting, nil];
    [items addObject:group2];
    
    return items;
}

+ (NSMutableArray *) getDiscoverItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *friendsAlbum = [[TLSettingItem alloc] initWithTitle:@"朋友圈" imageName:@"ff_IconShowAlbum"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:friendsAlbum, nil];
    [items addObject:group1];
    
    TLSettingItem *qrCode = [[TLSettingItem alloc] initWithTitle:@"扫一扫" imageName:@"ff_IconQRCode"];
    TLSettingItem *shake = [[TLSettingItem alloc] initWithTitle:@"摇一摇" imageName:@"ff_IconShake"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:qrCode, shake, nil];
    [items addObject:group2];
    
    TLSettingItem *loacation = [[TLSettingItem alloc] initWithTitle:@"附近的人" subTitle:@"" imageName:@"ff_IconLocationService" subImageName:@"FootStep" type: TLSettingItemTypeDefault];
    TLSettingItem *bottle = [[TLSettingItem alloc] initWithTitle:@"漂流瓶" imageName:@"ff_IconBottle"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:loacation, bottle, nil];
    [items addObject:group3];
    
    TLSettingItem *shopping = [[TLSettingItem alloc] initWithTitle:@"购物" imageName:@"CreditCard_ShoppingBag"];
    TLSettingItem *game = [[TLSettingItem alloc] initWithTitle:@"游戏" imageName:@"MoreGame"];
    TLSettingGrounp *group4 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:shopping, game, nil];
    [items addObject:group4];
    
    return items;
}

+ (NSMutableArray *) getDetailVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *tag = [[TLSettingItem alloc] initWithTitle:@"设置备注和标签"];
    TLSettingItem *phone = [[TLSettingItem alloc] initWithTitle:@"电话号码" subTitle:@"18888888888" type:TLSettingItemTypeLeft];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:tag, phone, nil];
    [items addObject:group1];
    TLSettingItem *position = [[TLSettingItem alloc] initWithTitle:@"地区" subTitle:@"山东 青岛" type:TLSettingItemTypeLeft];
    TLSettingItem *album = [[TLSettingItem alloc] initWithTitle:@"个人相册" subImages:[NSMutableArray arrayWithObjects:@"1.jpg", @"2.jpg", @"8.jpg", @"0.jpg", nil]];
    TLSettingItem *more = [[TLSettingItem alloc] initWithTitle:@"更多" type:TLSettingItemTypeLeft];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:position, album, more, nil];
    [items addObject:group2];
    
    TLSettingItem *chatButton = [[TLSettingItem alloc] initWithTitle:@"发消息"  type:TLSettingItemTypeButton];
    TLSettingItem *videoButton = [[TLSettingItem alloc] initWithTitle:@"视频聊天"  type:TLSettingItemTypeButton];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:chatButton, videoButton, nil];
    [items addObject:group3];
    
    return items;
}

+ (NSMutableArray *) getMineDetailVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *avatar = [[TLSettingItem alloc] initWithTitle:@"头像" subImageName:@"0.jpg" type:TLSettingItemTypeAvatar];
    TLSettingItem *name = [[TLSettingItem alloc] initWithTitle:@"名字" subTitle:@"Bay、栢"];
    TLSettingItem *num = [[TLSettingItem alloc] initWithTitle:@"微信号" subTitle:@"li-bokun"];
    TLSettingItem *code = [[TLSettingItem alloc] initWithTitle:@"我的二维码"];
    TLSettingItem *address = [[TLSettingItem alloc] initWithTitle:@"我的地址"];
    TLSettingGrounp *frist = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:avatar, name, num, code, address, nil];
    [items addObject:frist];
    
    TLSettingItem *sex = [[TLSettingItem alloc] initWithTitle:@"性别" subTitle:@"男"];
    TLSettingItem *pos = [[TLSettingItem alloc] initWithTitle:@"地址" subTitle:@"山东 滨州"];
    TLSettingItem *proverbs = [[TLSettingItem alloc] initWithTitle:@"个性签名" subTitle:@"Hello world!"];
    TLSettingGrounp *second = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:sex, pos, proverbs, nil];
    [items addObject:second];
    
    return items;
}

@end
