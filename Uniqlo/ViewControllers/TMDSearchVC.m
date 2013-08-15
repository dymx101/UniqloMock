//
//  TMDSearchVC.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/15/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDSearchVC.h"

@interface TMDSearchVC ()

@end

@implementation TMDSearchVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"搜索店铺";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"城市" style:UIBarButtonItemStylePlain target:self action:@selector(goPageCities:)];
}

-(void)goPageCities:(id)sender
{
    LOG_THE_METHORD;
}

@end
