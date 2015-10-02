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
    TLSettingItem *card = [[TLSettingItem alloc] initWithTitle:@"卡包" imageName:@"MyCardPackageIcon"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, card, nil];
    [items addObject:group1];
    
    TLSettingItem *expression = [[TLSettingItem alloc] initWithTitle:@"表情" imageName:@"MoreExpressionShops"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:expression, nil];
    [items addObject:group2];
    
    TLSettingItem *setting = [[TLSettingItem alloc] initWithTitle:@"设置" imageName:@"MoreSetting"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:setting, nil];
    [items addObject:group3];
    
    return items;
}

+ (NSMutableArray *) getDiscoverItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *friendsAlbum = [[TLSettingItem alloc] initWithTitle:@"朋友圈" subTitle:nil imageName:@"ff_IconShowAlbum" subImageName:@"2.jpg"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:friendsAlbum, nil];
    [items addObject:group1];
    
    TLSettingItem *qrCode = [[TLSettingItem alloc] initWithTitle:@"扫一扫" imageName:@"ff_IconQRCode"];
    TLSettingItem *shake = [[TLSettingItem alloc] initWithTitle:@"摇一摇" imageName:@"ff_IconShake"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:qrCode, shake, nil];
    [items addObject:group2];
    
    TLSettingItem *loacation = [[TLSettingItem alloc] initWithTitle:@"附近的人" subTitle:@"" imageName:@"ff_IconLocationService" subImageName:@"FootStep" type: TLSettingItemTypeDefaultL];
    TLSettingItem *bottle = [[TLSettingItem alloc] initWithTitle:@"漂流瓶" imageName:@"ff_IconBottle"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:loacation, bottle, nil];
    [items addObject:group3];
    
    TLSettingItem *shopping = [[TLSettingItem alloc] initWithTitle:@"购物" imageName:@"CreditCard_ShoppingBag"];
    TLSettingItem *game = [[TLSettingItem alloc] initWithTitle:@"游戏" subTitle:@"超火力新枪战" imageName:@"MoreGame" subImageName:@"game_tag_icon"];
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

+ (NSMutableArray *) getSettingVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *safe = [[TLSettingItem alloc] initWithTitle:@"账号和安全" subTitle:@"已保护" imageName:nil subImageName:@"ProfileLockOn" type:TLSettingItemTypeDefaultL];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:safe, nil];
    [items addObject:group1];
    
    TLSettingItem *noti = [[TLSettingItem alloc] initWithTitle:@"新消息通知"];
    TLSettingItem *privacy = [[TLSettingItem alloc] initWithTitle:@"隐私"];
    TLSettingItem *normal = [[TLSettingItem alloc] initWithTitle:@"通用"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:noti, privacy, normal, nil];
    [items addObject:group2];
    
    TLSettingItem *about = [[TLSettingItem alloc] initWithTitle:@"关于微信"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:about, nil];
    [items addObject:group3];
    
    TLSettingItem *exit = [[TLSettingItem alloc] initWithTitle:@"退出登陆" type:TLSettingItemTypeMidTitle];
    TLSettingGrounp *group4 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:exit, nil];
    [items addObject:group4];
    
    return items;
}

+ (NSMutableArray *) getDetailSettingVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];

    TLSettingItem *tag = [[TLSettingItem alloc] initWithTitle:@"设置备注及标签"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:tag, nil];
    [items addObject:group1];

    TLSettingItem *recommend = [[TLSettingItem alloc] initWithTitle:@"把他推荐给好友"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:recommend, nil];
    [items addObject:group2];
    
    TLSettingItem *starFriend = [[TLSettingItem alloc] initWithTitle:@"把它设为星标朋友" type:TLSettingItemTypeSwitch];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:starFriend, nil];
    [items addObject:group3];
    
    TLSettingItem *prohibit = [[TLSettingItem alloc] initWithTitle:@"不让他看我的朋友圈" type:TLSettingItemTypeSwitch];
    TLSettingItem *ignore = [[TLSettingItem alloc] initWithTitle:@"不看他的朋友圈" type:TLSettingItemTypeSwitch];
    TLSettingGrounp *group4 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:prohibit, ignore, nil];
    [items addObject:group4];
    
    TLSettingItem *addBlacklist = [[TLSettingItem alloc] initWithTitle:@"加入黑名单" type:TLSettingItemTypeSwitch];
    TLSettingItem *report = [[TLSettingItem alloc] initWithTitle:@"举报"];
    TLSettingGrounp *group5 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:addBlacklist, report, nil];
    [items addObject:group5];
    
    TLSettingItem *delete = [[TLSettingItem alloc] initWithTitle:@"删除好友" type:TLSettingItemTypeButton];
    TLSettingGrounp *group6 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:delete, nil];
    [items addObject:group6];

    return items;
}

+ (NSMutableArray *) getNewNotiVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    TLSettingItem *recNoti = [[TLSettingItem alloc] initWithTitle:@"接受新消息通知" subTitle:@"已开启"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"如果你要关闭或开启微信的新消息通知，请在iPhone的\"设置\" - \"通知\"功能中，找到应用程序\"微信\"更改。" settingItems:recNoti, nil];
    [items addObject:group1];
    
    TLSettingItem *showDetail = [[TLSettingItem alloc] initWithTitle:@"通知显示详情信息" type:TLSettingItemTypeSwitch];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，当收到微信消息时，通知提示将不显示发信人和内容摘要。" settingItems:showDetail, nil];
    [items addObject:group2];
    
    TLSettingItem *disturb = [[TLSettingItem alloc] initWithTitle:@"功能消息免打扰"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"设置系统功能消息提示声音和振动时段。" settingItems:disturb, nil];
    [items addObject:group3];
    
    TLSettingItem *voice = [[TLSettingItem alloc] initWithTitle:@"声音" type:TLSettingItemTypeSwitch];
    TLSettingItem *shake = [[TLSettingItem alloc] initWithTitle:@"震动" type:TLSettingItemTypeSwitch];
    TLSettingGrounp *group4 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"当微信在运行时，你可以设置是否需要声音或者振动。" settingItems:voice, shake, nil];
    [items addObject:group4];

    TLSettingItem *friends = [[TLSettingItem alloc] initWithTitle:@"朋友圈照片更新" type:TLSettingItemTypeSwitch];
    TLSettingGrounp *group5 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，有朋友更新照片时，界面下面的“发现”切换按钮上不再出现红点提示。" settingItems:friends, nil];
    [items addObject:group5];

    return items;
}

@end
