//
//  TMDSecondViewController.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/11/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDMallVC.h"
#import "JBTabBarController.h"

@interface TMDMallVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tv;

@end

@implementation TMDMallVC
{
    NSArray     *_dataSource;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.title = NSLocalizedString(@"Second", @"Second");
        //self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.navigationItem.title = @"商城";
        self.tabBarItem.image = [UIImage imageNamed:@"tab2Black"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab2Red"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = GGSharedColor.silver;
    
//    _dataSource = @[@"商品收藏夹", @"商品手册", @"用户指南",@"关于优药店", @"关注优药店", @"联系我们",@"设置",@"商品收藏夹", @"商品手册", @"用户指南",@"关于优药店"];
//    _tv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//    _tv.frame = CGRectMake(5, 70, 310, self.view.bounds.size.height - 70 - 40);
//    _tv.backgroundView = nil;
//    _tv.showsVerticalScrollIndicator = NO;
//    _tv.dataSource = self;
//    _tv.delegate = self;
//    
//    [self.view addSubview:_tv];
}

- (void)viewDidUnload {
//    [self setTv:nil];
    [super viewDidUnload];
}

//#pragma mark -
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return  _dataSource.count;
//}
//
//// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
//// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *cellID = @"cellID";
//    UIFont* font = [UIFont fontWithName:@"Futura-Medium" size:15.0f];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
//    cell.textLabel.font = font;
//    cell.backgroundColor = GGSharedColor.whiteAlmost;
//    cell.textLabel.text = (NSString *)(_dataSource[indexPath.row]);
//    
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 40;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}
//
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
