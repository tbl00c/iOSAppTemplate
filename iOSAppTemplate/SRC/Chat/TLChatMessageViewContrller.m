//
//  TLChatMessageViewContrller.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLChatMessageViewContrller.h"

#import "TLTextMessageCell.h"
#import "TLImageMessageCell.h"
#import "TLVoiceMessageCell.h"
#import "TLSystemMessageCell.h"

@interface TLChatMessageViewContrller ()

@property (nonatomic, strong) UITapGestureRecognizer *tapGR;

@end

@implementation TLChatMessageViewContrller

#pragma mark - LifeCycle
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:DEFAULT_CHAT_BACKGROUND_COLOR];
    [self.view addGestureRecognizer:self.tapGR];
    [self.tableView setTableFooterView:[UIView new]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView registerClass:[TLTextMessageCell class] forCellReuseIdentifier:@"TextMessageCell"];
    [self.tableView registerClass:[TLImageMessageCell class] forCellReuseIdentifier:@"ImageMessageCell"];
    [self.tableView registerClass:[TLVoiceMessageCell class] forCellReuseIdentifier:@"VoiceMessageCell"];
    [self.tableView registerClass:[TLSystemMessageCell class] forCellReuseIdentifier:@"SystemMessageCell"];;
}

#pragma mark - Public Methods
- (void) addNewMessage:(TLMessage *)message
{
    [self.data addObject:message];
    [self.tableView reloadData];
}

- (void) scrollToBottom
{
    if (_data.count > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_data.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMessage *message = [_data objectAtIndex:indexPath.row];
    id cell = [tableView dequeueReusableCellWithIdentifier:message.cellIndentify];
    [cell setMessage:message];
    return cell;
}

#pragma mark - UITableViewCellDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMessage *message = [_data objectAtIndex:indexPath.row];
    return message.cellHeight;
}

#pragma mark - UIScrollViewDelegate
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

#pragma mark - Event Response
- (void) didTapView
{
    if (_delegate && [_delegate respondsToSelector:@selector(didTapChatMessageView:)]) {
        [_delegate didTapChatMessageView:self];
    }
}

#pragma mark - Getter
- (UITapGestureRecognizer *) tapGR
{
    if (_tapGR == nil) {
        _tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView)];
    }
    return _tapGR;
}

- (NSMutableArray *) data
{
    if (_data == nil) {
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}

@end
