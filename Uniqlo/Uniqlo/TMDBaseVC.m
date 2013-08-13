//
//  TMDBaseVC.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/13/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDBaseVC.h"
#import "PrettyKit.h"

@interface TMDBaseVC ()

@end

@implementation TMDBaseVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self customizeNavBar];
}

- (void) customizeNavBar {
    PrettyNavigationBar *navBar = (PrettyNavigationBar *)self.navigationController.navigationBar;
    
    navBar.topLineColor = [UIColor colorWithHex:0xFF1000];
    navBar.gradientStartColor = [UIColor colorWithHex:0xDD0000];
    navBar.gradientEndColor = [UIColor colorWithHex:0xAA0000];
    navBar.bottomLineColor = [UIColor colorWithHex:0x990000];
    navBar.tintColor = navBar.gradientEndColor;
    navBar.roundedCornerRadius = 8;
}

@end
