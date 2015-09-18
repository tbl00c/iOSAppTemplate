//
//  TLWebViewController.m
//  iOSAppTemplate
//
//  Created by h1r0 on 15/9/19.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLWebViewController.h"

@interface TLWebViewController () <UIWebViewDelegate>

@end

@implementation TLWebViewController

- (id) init
{
    if (self = [super init]) {
        _webView = [[UIWebView alloc] init];
        [_webView setDelegate:self];
        [_webView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:_webView];
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_webView setFrame:CGRectMake(0, 0, self.view.frameWidth, self.view.frameHeight)];
}

- (void) setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [self.navigationItem setTitle:title];
}

@end
