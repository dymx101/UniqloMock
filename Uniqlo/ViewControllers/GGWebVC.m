//
//  GGWebVC.m
//  Gagein
//
//  Created by dong yiming on 13-4-21.
//  Copyright (c) 2013年 gagein. All rights reserved.
//

#import "GGWebVC.h"

@interface GGWebVC ()
@property (copy) NSString *urlStr;
@property (copy) NSString *naviTitleString;
@end

@implementation GGWebVC
{
    UIWebView   *_webview;
    //UIImageView *_ivLogo;
}

-(id)initWIthURL:(NSString *)urlStr title:(NSString *)aTitle
{
    self = [super init];
    if (self)
    {
        _urlStr = urlStr;
        _naviTitleString = aTitle;
    }
    
    return self;
}

#define WEB_PREFIX_HTTP     @"http://"
#define WEB_PREFIX_HTTPS     @"https://"

#define ZOOM_RATIO          (.6f)
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _naviTitleString;
    
    
    //UIImage *logo = GGSharedImagePool.logoGageinWithName;
   // _ivLogo = [[UIImageView alloc] initWithImage:logo];
    //_ivLogo.alpha = .3f;
    
    //CGSize displaySize = CGSizeMake(logo.size.width * ZOOM_RATIO, logo.size.height * ZOOM_RATIO);
    //CGSize naviBarSize = self.navigationController.navigationBar.frame.size;
    //_ivLogo.frame = CGRectMake((naviBarSize.width - displaySize.width) / 2, (naviBarSize.height - displaySize.height) / 2 + 5, displaySize.width, displaySize.height);
    
	
    _webview = [[UIWebView alloc] initWithFrame:self.view.bounds];//[GGLayout pageRectWithLayoutElement:kLayoutElementStatusBar | kLayoutElementNaviBar]];
    _webview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webview.delegate = self;
    _webview.scalesPageToFit = YES;
    [self.view addSubview:_webview];
    
    if (_urlStr
        && [_urlStr rangeOfString:WEB_PREFIX_HTTP].location == NSNotFound
        && [_urlStr rangeOfString:WEB_PREFIX_HTTPS].location == NSNotFound)
    {
        _urlStr = [NSString stringWithFormat:@"%@%@", WEB_PREFIX_HTTP, _urlStr];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]];
    [_webview loadRequest:request];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    DLog(@"webview loading: {%@}", _urlStr);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[self showBackButton];
    
//    if (_naviTitleString.length <= 0)
//    {
//        [self.navigationController.navigationBar addSubview:_ivLogo];
//    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //[_ivLogo removeFromSuperview];
}

-(void)dealloc
{
    _webview.delegate = nil;
}

#pragma mark - web view delegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
