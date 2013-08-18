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
{
    NSMutableDictionary *data;
}
@end

@implementation TMDTableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        data = [[NSMutableDictionary alloc] initWithObjects:
                @[
                @[@"砒石(外用蚀疮杀虫，内服劫痰截疟)",@"磁石（镇惊安神）",@"芒硝（软坚泻下）",@"芦荟芦荟(清热，通便)",@"泽兰(活血祛瘀)",@"桑叶(祛风清热)",@"百合(养阴润肺止咳)",@"艾叶(理气血、温经脉)",@"款冬花(润肺下气)"],
                @[@"枸杞	(成都通灵中药饮片精选有限公司)",@"当归	(安徽广印堂中药股份有限公司)",@"白芷	(亳州市盛林中药饮片有限公司)",@"公丁香	(通用美康医药有限公司)",@"金银花	(重庆市秀山红星中药材开发有限公司)",@"冬虫夏草	(成都通灵中药饮片精选有限公司)",@"柴胡	(成都通灵中药饮片精选有限公司)",@"柴胡	(成都通灵中药饮片精选有限公司)",@"白芷	(亳州市盛林中药饮片有限公司)"],
                @[@"栀子金花丸(双士药业)",@"京制牛黄解毒片(同仁堂科技)",@"栀子金花丸(九郡药业)",@"四季三黄片(9g)",@"十味龙胆花颗粒",@"四季三黄片(中新药业)",@"凉膈丸",@"金衣万应丸",@"栀芩清热液(橄榄枝制药)"],
                @[@"伤风感冒冲剂",@"防风通圣丸",@"四味土木香散",@"复方野菊感冒冲剂",@"穿心莲胶囊",@"速效伤风胶囊",@"柴胡注射液",@"银翘解毒丸",@"鱼腥草注射液"],
                @[@"盐酸去氧肾上腺素",@"盐酸罂粟碱",@"藻酸双脂钠",@"硫酸吗啡控释片",@"丙戊酸钠缓释片",@"丙戊酸钠缓释片",@"卡马西平胶囊",@"单盐酸氟西泮",@"氢溴酸西酞普兰"]] forKeys:@[@"One",@"Two",@"Three",@"Four",@"Five"]];
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
    
    //UIView *headerView = [[UIView alloc] init];
    self.view.backgroundColor = [GGSharedColor colorFromR:235 g:235 b:235];
    //((UITableView *)self.view).tableHeaderView = headerView;
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
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    UIFont* font = [UIFont fontWithName:@"Futura-Medium" size:13.0f];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
	cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.font = font;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    NSArray *cellTitleArray = [data objectForKey:self.title];
	cell.textLabel.text = [cellTitleArray objectAtIndex:indexPath.row];
    
    //cell.contentView.backgroundColor = GGSharedColor.white;
    UIView *bgView = [[UIView alloc] initWithFrame:cell.contentView.bounds];
//    bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    bgView.backgroundColor = GGSharedColor.silverLight;
    [cell.contentView insertSubview:bgView belowSubview:cell.textLabel];
    
    cell.textLabel.backgroundColor = GGSharedColor.clear;
    
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
