//
//  TMDNewsVC.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/15/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDNewsVC.h"
#import "JBTabBarController.h"

#import "TMDNewsCell.h"
#import "UIView+LoadFromNib.h"

@interface TMDNewsVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tv;

@end

@implementation TMDNewsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"tab4Black"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab4Red"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tv.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)viewDidUnload {
    [self setTv:nil];
    [super viewDidUnload];
}

#pragma mark -
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    TMDNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [TMDNewsCell viewFromNibWithOwner:self];//[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.contentView.backgroundColor = GGSharedColor.silver;
    //cell.textLabel.text = @"aaa";
    
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 350.f;
}

@end
