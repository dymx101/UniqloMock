//
//  TMDCouponVC.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/15/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDCouponVC.h"
#import "JBTabBarController.h"

@interface TMDCouponVC ()

@end

@implementation TMDCouponVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"礼券";
        self.tabBarItem.image = [UIImage imageNamed:@"tab3Black"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab3Red"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
