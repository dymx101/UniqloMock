//
//  TMDMoreVC.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/15/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDMoreVC.h"
#import "JBTabBarController.h"

@interface TMDMoreVC () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tv;

@end

@implementation TMDMoreVC
{
    NSArray     *_dataSource;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"更多";
        self.tabBarItem.image = [UIImage imageNamed:@"tab5Black"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab5Red"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = GGSharedColor.silver;
    
    _dataSource = @[@[@"商品收藏夹", @"商品手册", @"用户指南"],
                    @[@"关于优药店", @"关注优药店", @"联系我们"],
                    @[@"设置"],
                    ];
    
    _tv.backgroundView = nil;
    _tv.showsVerticalScrollIndicator = NO;
}

- (void)viewDidUnload {
    [self setTv:nil];
    [super viewDidUnload];
}


#pragma mark -
-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section < _dataSource.count)
    {
        NSArray *dataArr = _dataSource[section];
        return dataArr.count;
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UIFont* font = [UIFont fontWithName:@"Futura-Medium" size:17.0f];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.font = font;
    cell.textLabel.text = (NSString *)(((NSArray *)(_dataSource[indexPath.section]))[indexPath.row]);
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
