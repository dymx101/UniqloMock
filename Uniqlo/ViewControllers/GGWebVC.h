//
//  GGWebVC.h
//  Gagein
//
//  Created by dong yiming on 13-4-21.
//  Copyright (c) 2013年 gagein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDBaseVC.h"

@interface GGWebVC : TMDBaseVC <UIWebViewDelegate>


-(id)initWIthURL:(NSString *)urlStr title:(NSString *)aTitle;
@end
