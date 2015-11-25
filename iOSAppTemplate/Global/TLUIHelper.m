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
    TLSettingItem *notify = [TLSettingItem createWithImageName:@"plugins_FriendNotify" title:@"新的朋友"];
    TLSettingItem *friendGroup = [TLSettingItem createWithImageName:@"add_friend_icon_addgroup" title:@"群聊"];
    TLSettingItem *tag = [TLSettingItem createWithImageName:@"Contact_icon_ContactTag" title:@"标签"];
    TLSettingItem *offical = [TLSettingItem createWithImageName:@"add_friend_icon_offical" title:@"公众号"];
    TLSettingGrounp *group = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:notify, friendGroup, tag, offical, nil];
    return group;
}

+ (NSMutableArray *) getMineVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *album = [TLSettingItem createWithImageName:@"MoreMyAlbum" title:@"相册"];
    TLSettingItem *favorite = [TLSettingItem createWithImageName:@"MoreMyFavorites" title:@"收藏"];
    TLSettingItem *bank = [TLSettingItem createWithImageName:@"MoreMyBankCard" title:@"钱包"];
    TLSettingItem *card = [TLSettingItem createWithImageName:@"MyCardPackageIcon" title:@"卡包"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, card, nil];
    [items addObject:group1];

    TLSettingItem *expression = [TLSettingItem createWithImageName:@"MoreExpressionShops" title:@"表情"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:expression, nil];
    [items addObject:group2];
    
    TLSettingItem *setting = [TLSettingItem createWithImageName:@"MoreSetting" title:@"设置"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:setting, nil];
    [items addObject:group3];
    return items;
}

+ (NSMutableArray *) getDiscoverItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *friendsAlbum = [TLSettingItem createWithImageName:@"ff_IconShowAlbum" title:@"朋友圈" subTitle:nil rightImageName:@"2.jpg"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:friendsAlbum, nil];
    [items addObject:group1];

    TLSettingItem *qrCode = [TLSettingItem createWithImageName:@"ff_IconQRCode" title:@"扫一扫"];
    TLSettingItem *shake = [TLSettingItem createWithImageName:@"ff_IconShake" title:@"摇一摇"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:qrCode, shake, nil];
    [items addObject:group2];
    
    TLSettingItem *loacation = [TLSettingItem createWithImageName:@"ff_IconLocationService" title:@"附近的人" subTitle:nil rightImageName:@"FootStep"];
    loacation.rightImageHeightOfCell = 0.43;
    TLSettingItem *bottle = [TLSettingItem createWithImageName:@"ff_IconBottle" title:@"漂流瓶"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:loacation, bottle, nil];
    [items addObject:group3];

    TLSettingItem *shopping = [TLSettingItem createWithImageName:@"CreditCard_ShoppingBag" title:@"购物"];
    TLSettingItem *game = [TLSettingItem createWithImageName:@"MoreGame" title:@"游戏" subTitle:@"超火力新枪战" rightImageName:@"game_tag_icon"];
    TLSettingGrounp *group4 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:shopping, game, nil];
    [items addObject:group4];

    return items;
}

+ (NSMutableArray *) getDetailVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *tag = [TLSettingItem createWithTitle:@"设置备注和标签"];
    TLSettingItem *phone = [TLSettingItem createWithTitle:@"电话号码" subTitle:@"18888888888"];
    phone.alignment = TLSettingItemAlignmentLeft;
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:tag, phone, nil];
    [items addObject:group1];
    TLSettingItem *position = [TLSettingItem createWithTitle:@"地区" subTitle:@"山东 青岛"];
    position.alignment = TLSettingItemAlignmentLeft;
    TLSettingItem *album = [TLSettingItem createWithTitle:@"个人相册"];
    album.subImages = @[@"1.jpg", @"2.jpg", @"8.jpg", @"0.jpg"];
    album.alignment = TLSettingItemAlignmentLeft;
    TLSettingItem *more = [TLSettingItem createWithTitle:@"更多"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:position, album, more, nil];
    [items addObject:group2];

    TLSettingItem *chatButton = [TLSettingItem createWithTitle:@"发消息"];
    chatButton.type = TLSettingItemTypeButton;
    TLSettingItem *videoButton = [TLSettingItem createWithTitle:@"视频聊天"];
    videoButton.type = TLSettingItemTypeButton;
    videoButton.btnBGColor = [UIColor whiteColor];
    videoButton.btnTitleColor = [UIColor blackColor];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:chatButton, videoButton, nil];
    [items addObject:group3];
    
    return items;
}

+ (NSMutableArray *) getMineDetailVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *avatar = [TLSettingItem createWithImageName:nil title:@"头像" subTitle:nil rightImageName:@"0.jpg"];
    TLSettingItem *name = [TLSettingItem createWithTitle:@"名字" subTitle:@"Bay、栢"];
    TLSettingItem *num = [TLSettingItem createWithTitle:@"微信号" subTitle:@"li-bokun"];
    TLSettingItem *code = [TLSettingItem createWithTitle:@"我的二维码"];
    TLSettingItem *address = [TLSettingItem createWithTitle:@"我的地址"];
    TLSettingGrounp *frist = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:avatar, name, num, code, address, nil];
    [items addObject:frist];
    
    TLSettingItem *sex = [TLSettingItem createWithTitle:@"性别" subTitle:@"男"];
    TLSettingItem *pos = [TLSettingItem createWithTitle:@"地址" subTitle:@"山东 滨州"];
    TLSettingItem *proverbs = [TLSettingItem createWithTitle:@"个性签名" subTitle:@"Hello world!"];
    TLSettingGrounp *second = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:sex, pos, proverbs, nil];
    [items addObject:second];
    
    return items;
}

+ (NSMutableArray *) getSettingVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *safe = [TLSettingItem createWithImageName:nil title:@"账号和安全" middleImageName:@"ProfileLockOn" subTitle:@"已保护"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:safe, nil];
    [items addObject:group1];
    
    TLSettingItem *noti = [TLSettingItem createWithTitle:@"新消息通知"];
    TLSettingItem *privacy = [TLSettingItem createWithTitle:@"隐私"];
    TLSettingItem *normal = [TLSettingItem createWithTitle:@"通用"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:noti, privacy, normal, nil];
    [items addObject:group2];

    TLSettingItem *feedBack = [TLSettingItem createWithTitle:@"帮助与反馈"];
    TLSettingItem *about = [TLSettingItem createWithTitle:@"关于微信"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:feedBack, about, nil];
    [items addObject:group3];
    
    TLSettingItem *exit = [TLSettingItem createWithTitle:@"退出登陆"];
    [exit setAlignment:TLSettingItemAlignmentMiddle];
    TLSettingGrounp *group4 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:exit, nil];
    [items addObject:group4];
    
    return items;
}

+ (NSMutableArray *) getDetailSettingVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];

    TLSettingItem *tag = [TLSettingItem createWithTitle:@"设置备注及标签"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:tag, nil];
    [items addObject:group1];

    TLSettingItem *recommend = [TLSettingItem createWithTitle:@"把他推荐给好友"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:recommend, nil];
    [items addObject:group2];
    
    TLSettingItem *starFriend = [TLSettingItem createWithTitle:@"把它设为星标朋友"];
    starFriend.type = TLSettingItemTypeSwitch;
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:starFriend, nil];
    [items addObject:group3];
    
    TLSettingItem *prohibit = [TLSettingItem createWithTitle:@"不让他看我的朋友圈"];
    prohibit.type = TLSettingItemTypeSwitch;
    TLSettingItem *ignore = [TLSettingItem createWithTitle:@"不看他的朋友圈"];
    ignore.type = TLSettingItemTypeSwitch;
    TLSettingGrounp *group4 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:prohibit, ignore, nil];
    [items addObject:group4];
    
    TLSettingItem *addBlacklist = [TLSettingItem createWithTitle:@"加入黑名单"];
    addBlacklist.type = TLSettingItemTypeSwitch;
    TLSettingItem *report = [TLSettingItem createWithTitle: @"举报"];
    TLSettingGrounp *group5 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:addBlacklist, report, nil];
    [items addObject:group5];

    TLSettingItem *delete = [TLSettingItem createWithTitle:@"删除好友"];
    delete.type = TLSettingItemTypeButton;
    TLSettingGrounp *group6 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:delete, nil];
    [items addObject:group6];

    return items;
}

+ (NSMutableArray *) getNewNotiVCItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    TLSettingItem *recNoti = [TLSettingItem createWithTitle:@"接受新消息通知" subTitle:@"已开启"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"如果你要关闭或开启微信的新消息通知，请在iPhone的“设置” - “通知”功能中，找到应用程序“微信”更改。" settingItems:recNoti, nil];
    [items addObject:group1];

    TLSettingItem *showDetail = [TLSettingItem createWithTitle:@"通知显示详情信息"];
    showDetail.type = TLSettingItemTypeSwitch;
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，当收到微信消息时，通知提示将不显示发信人和内容摘要。" settingItems:showDetail, nil];
    [items addObject:group2];
    
    TLSettingItem *disturb = [TLSettingItem createWithTitle:@"功能消息免打扰"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"设置系统功能消息提示声音和振动时段。" settingItems:disturb, nil];
    [items addObject:group3];

    TLSettingItem *voice = [TLSettingItem createWithTitle:@"声音"];
    voice.type = TLSettingItemTypeSwitch;
    TLSettingItem *shake = [TLSettingItem createWithTitle:@"震动"];
    shake.type = TLSettingItemTypeSwitch;
    TLSettingGrounp *group4 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"当微信在运行时，你可以设置是否需要声音或者振动。" settingItems:voice, shake, nil];
    [items addObject:group4];

    TLSettingItem *friends = [TLSettingItem createWithTitle:@"朋友圈照片更新"];
    friends.type = TLSettingItemTypeSwitch;
    TLSettingGrounp *group5 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:@"关闭后，有朋友更新照片时，界面下面的“发现”切换按钮上不再出现红点提示。" settingItems:friends, nil];
    [items addObject:group5];

    return items;
}

@end
