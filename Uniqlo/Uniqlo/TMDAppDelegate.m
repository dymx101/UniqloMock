//
//  TMDAppDelegate.m
//  Uniqlo
//
//  Created by Dong Yiming on 8/11/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import "TMDAppDelegate.h"

#import "JBTabBar.h"

#import "TMDHomeVC.h"

#import "TMDMallVC.h"
#import "TMDCouponVC.h"
#import "TMDNewsVC.h"
#import "TMDMoreVC.h"

#import "TMDSegmentPC.h"
#import "TMDTableVC.h"

#import "TMDNaviController.h"

@implementation TMDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //JBTabBarController* tabBarController = [[JBTabBarController alloc] init];
    
    
    UIViewController *viewController1 = [[TMDNaviController alloc] initWithRootViewController:[TMDHomeVC new]];
    
    // INIT THE SEGMENT PC
    TMDTableVC *tmdTV1 = [[TMDTableVC alloc] initWithStyle:UITableViewStylePlain];
	TMDTableVC *tmdTV2 = [[TMDTableVC alloc] initWithStyle:UITableViewStylePlain];
	TMDTableVC *tmdTV3 = [[TMDTableVC alloc] initWithStyle:UITableViewStylePlain];
    TMDTableVC *tmdTV4 = [[TMDTableVC alloc] initWithStyle:UITableViewStylePlain];
	TMDTableVC *tmdTV5 = [[TMDTableVC alloc] initWithStyle:UITableViewStylePlain];
	
	tmdTV1.title = @"One";
	tmdTV2.title = @"Two";
	tmdTV3.title = @"Three";
    tmdTV4.title = @"Four";
    tmdTV5.title = @"Five";
    
	NSArray *viewControllers = @[tmdTV1,tmdTV2,tmdTV3,tmdTV4,tmdTV5];
    
	TMDSegmentPC *tmdSGPC = [TMDSegmentPC new];
	tmdSGPC.delegate = self;
	tmdSGPC.viewControllers = viewControllers;
    UIViewController *viewController2 = [[TMDNaviController alloc] initWithRootViewController:tmdSGPC];// [[TMDSecondViewController alloc] initWithNibName:@"TMDSecondViewController" bundle:nil];
    
    UIViewController *viewController3 = [[TMDNaviController alloc] initWithRootViewController:[TMDCouponVC new]];//[[TMDFirstViewController alloc] initWithNibName:@"TMDFirstViewController" bundle:nil];
    UIViewController *viewController4 = [[TMDNaviController alloc] initWithRootViewController:[TMDNewsVC new]];//[[TMDSecondViewController alloc] initWithNibName:@"TMDSecondViewController" bundle:nil];
    
    //
    UIViewController *viewController5 = [[TMDNaviController alloc] initWithRootViewController:[TMDMoreVC new]];
    
    self.tabBarController = [JBTabBarController new];//[[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[viewController1, viewController2, viewController3, viewController4, viewController5];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
