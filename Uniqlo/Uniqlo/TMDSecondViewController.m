//
//  TMDSecondViewController.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/11/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDSecondViewController.h"
#import "JBTabBarController.h"

@interface TMDSecondViewController ()

@end

@implementation TMDSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.title = NSLocalizedString(@"Second", @"Second");
        //self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.title = @"Brain";
        self.tabBarItem.image = [UIImage imageNamed:@"Brain-unselected"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"Brain-selected"];
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
