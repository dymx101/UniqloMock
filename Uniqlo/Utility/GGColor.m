//
//  OTSColor.m
//  OneStore
//
//  Created by Yim Daniel on 13-1-17.
//  Copyright (c) 2013年 OneStore. All rights reserved.
//

#import "GGColor.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation GGColor
DEF_SINGLETON(GGColor)

-(UIColor *)darkRed
{
    return UIColorFromRGB(0xAA1E1E);
}

-(UIColor *)orange
{
    return [UIColor orangeColor];
}

-(UIColor *)orangeGagein
{
    return UIColorFromRGB(0xDA9432);
}

-(UIColor *)orangeGageinDark
{
    return UIColorFromRGB(0xE06125);
}

-(UIColor *)white
{
    return UIColorFromRGB(0xFFFFFF);
}

-(UIColor *)black
{
    return UIColorFromRGB(0);
}

-(UIColor *)gray
{
    return UIColorFromRGB(0x666666);
}

-(UIColor *)lightGray
{
    return UIColorFromRGB(0x999999);
}

-(UIColor *)veryLightGray
{
    return UIColorFromRGB(0xcccccc);
}

-(UIColor *)silver
{
    return UIColorFromRGB(0xE5E5E5);
}

-(UIColor *)sliverWithAlpha:(float)anAlpha
{
    return [UIColor colorWithWhite:(0xE5 / 255.f) alpha:anAlpha];
}

-(UIColor *)silverLight
{
    return UIColorFromRGB(0xEFEFEF);
}

-(UIColor *)whiteAlmost
{
    return UIColorFromRGB(0xF9F9F9);
}

-(UIColor *)darkGray
{
    return UIColorFromRGB(0x333333);
}

-(UIColor *)ironGray
{
    return UIColorFromRGB(0x393939);
}

-(UIColor *)bgGray
{
    return UIColorFromRGB(0x343434);
}

-(UIColor *)grayTopText
{
    return [UIColor colorWithWhite:.7f alpha:1.f];
}

-(UIColor *)graySettingBg
{
    return UIColorFromRGB(0x313131);
}

-(UIColor *)clear
{
    return [UIColor clearColor];
}

-(UIColor *)colorFromR:(int)aRed g:(int)aGreen b:(int)aBlue
{
    return [UIColor colorWithRed:aRed / 255.f green:aGreen / 255.f blue:aBlue / 255.f alpha:1.f];
}

-(UIColor *)random
{
    return [self colorFromR:(arc4random() % 255) g:(arc4random() % 255) b:(arc4random() % 255)];
}


@end
