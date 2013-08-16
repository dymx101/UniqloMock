//
//  TMDTableVC.m
//  Uniqlo
//
//  Created by towne on 13-8-17.
//  Copyright (c) 2013年 Dong Yiming. All rights reserved.
//

#import "TMDTableVC.h"
#import "TMDSegmentPC.h"

@interface TMDTableVC ()

@end

@implementation TMDTableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    UIFont* font = [UIFont fontWithName:@"Futura-Medium" size:15.0f];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
	cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.font = font;
	cell.textLabel.text = [NSString stringWithFormat:@"Page %@ - Row %d", self.title, indexPath.row];
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"%@, parent is %@", self.title, self.parentViewController);
    
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//	TMDTableVC *listViewController1 = [[TMDTableVC alloc] initWithStyle:UITableViewStylePlain];
//	TMDTableVC *listViewController2 = [[TMDTableVC alloc] initWithStyle:UITableViewStylePlain];
//	
//    NSString *myName = ((TMDSegmentPC *) self.parentViewController).selectedViewController.title;
//    
//	listViewController1.title = [NSString stringWithFormat: @"%@ sub 1", myName];
//	listViewController2.title = [NSString stringWithFormat: @"%@ sub 2", myName];
//    
//	NSArray *viewControllers = [NSArray arrayWithObjects:listViewController1, listViewController2, nil];
//	TMDSegmentPC *segmentPageController = [[TMDSegmentPC alloc] init];
//	segmentPageController.viewControllers = viewControllers;
//	segmentPageController.title = @"Modal dialog";
//	segmentPageController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
//                                                              initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissModalScreen:)];
//    
//	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:segmentPageController];
//	navController.navigationBar.tintColor = [UIColor colorWithRed:70/255.0f green:80/255.0f blue:90/255.0f alpha:1.0f];
//	[self presentViewController:navController animated:YES completion:nil];
}

- (IBAction)dismissModalScreen:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
