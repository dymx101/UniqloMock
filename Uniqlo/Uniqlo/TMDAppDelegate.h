//
//  TMDAppDelegate.h
//  Uniqlo
//
//  Created by Dong Yiming on 8/11/13.
//  Copyright (c) 2013 Dong Yiming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBTabBarController.h"
#import "TMDSegmentPC.h"

@interface TMDAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate,TMDSegmentPCDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JBTabBarController *tabBarController;

@end
