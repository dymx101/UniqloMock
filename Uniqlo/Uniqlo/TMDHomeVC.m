//
//  TMDFirstViewController.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/11/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDHomeVC.h"
#import "JBTabBarController.h"
#import "KASlideShow.h"
#import "UIView+AddOn.h"
#import "SMPageControl.h"

#import "GGWebVC.h"

@interface TMDHomeVC () <KASlideShowDelegate>

@end

@implementation TMDHomeVC
{
    KASlideShow         *_viewSlideShow;
    SMPageControl       *_pageControl;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.title = NSLocalizedString(@"First", @"First");
        //self.tabBarItem.image = [UIImage imageNamed:@"first"];
        self.title = @"店铺";
        self.tabBarItem.image = [UIImage imageNamed:@"green0.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"green0.png"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = GGSharedColor.silverLight;
	
    [self _installSlideShow];
}

-(void)_installSlideShow
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 15, 300, 200)];
    bgView.backgroundColor = GGSharedColor.white;
    [bgView applyEffectShadowAndBorder];
    [self.view addSubview:bgView];
    
    _viewSlideShow = [[KASlideShow alloc] initWithFrame:CGRectMake(0, 30, 300, 100)];
    [bgView addSubview:_viewSlideShow];
    
    _viewSlideShow.delegate = self;
    [_viewSlideShow setDelay:3];
    [_viewSlideShow setTransitionDuration:.5f];
    [_viewSlideShow setTransitionType:KASlideShowTransitionSlide];
    [_viewSlideShow setImagesContentMode:UIViewContentModeScaleAspectFill];
    [_viewSlideShow addImagesFromResources:@[@"sample_adv1.jpg",@"sample_adv2.jpg",@"sample_adv3.jpg"]];
    [_viewSlideShow start];
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(slideTapped:)];
    [_viewSlideShow addGesture:KASlideShowGestureSwipe];
    [_viewSlideShow addGestureRecognizer:tapGest];
    
    _pageControl = [[SMPageControl alloc] init];
    _pageControl.numberOfPages = 3;
    _pageControl.pageIndicatorImage = [UIImage imageNamed:@"pageDot"];
    _pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"currentPageDot"];
    [_pageControl sizeToFit];
    [bgView addSubview:_pageControl];
    
    [_pageControl setPosY:150];
    [_pageControl setPosX:(bgView.frame.size.width - _pageControl.frame.size.width) / 2];
}

-(void)slideTapped:(id)sender
{
    DLog(@"%d", _viewSlideShow.currentIndex);
    GGWebVC *vc = [[GGWebVC alloc] initWIthURL:@"http://bing.com" title:@"演示页面"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - KASlideShow delegate

- (void)kaSlideShowDidNext
{
    //NSLog(@"kaSlideShowDidNext");
    _pageControl.currentPage = _viewSlideShow.currentIndex;
}

-(void)kaSlideShowDidPrevious
{
    //NSLog(@"kaSlideShowDidPrevious");
    _pageControl.currentPage = _viewSlideShow.currentIndex;
}

@end
