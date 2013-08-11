//
//  TMDFirstViewController.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/11/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDFirstViewController.h"
#import "JBTabBarController.h"

@interface TMDFirstViewController ()

@end

@implementation TMDFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.title = NSLocalizedString(@"First", @"First");
        //self.tabBarItem.image = [UIImage imageNamed:@"first"];
        self.title = @"At";
        self.tabBarItem.image = [UIImage imageNamed:@"At-unselected"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"At-selected"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
