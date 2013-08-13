//
//  TMDNaviController.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/13/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDNaviController.h"
#import "PrettyKit.h"

@interface TMDNaviController ()

@end

@implementation TMDNaviController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.navigationBar = [[PrettyNavigationBar alloc] init];
        [self setValue:[PrettyNavigationBar new] forKeyPath:@"navigationBar"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
