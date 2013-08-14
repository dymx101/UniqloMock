//
//  UIView+AddOn.h
//  Gagein
//
//  Created by Dong Yiming on 5/22/13.
//  Copyright (c) 2013 gagein. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (AddOn)
@property (strong, nonatomic) NSNumber *tagNumber;
@property (strong, nonatomic) id        data;

-(void)showLoadingHUD;
-(void)showLoadingHUDWithOffsetY:(float)aOffsetY;
-(void)showLoadingHUDWithOffset:(CGSize)aOffset;
-(void)showLoadingHUDWithTitle:(NSString *)aTitle;
-(void)showLoadingHUDWithText:(NSString *)aText;

-(void)hideLoadingHUD;
-(void)hideAllHUDs;

-(void)removeAllGestureRecognizers;

-(void)goTop;

-(UIView *)ancestorView;

-(void)printViewsTree;

-(void)centerMeHorizontally;

-(void)centerMeHorizontallyChangeMyWidth:(CGFloat)aWidth;

-(void)resignAllResponders;


-(float)maxHeightForContent;

-(void)adjustHeightToFitContent;

-(void)setPosX:(float)aX;
-(void)setPosY:(float)aY;
-(void)setPos:(CGPoint)aNewPos;
-(void)setHeight:(float)aNewHeight;
-(void)setWidth:(float)aNewWidth;

-(UIImage *)myPicture;

-(NSString *)frameString;

+(float)HEIGHT;
+(float)WIDTH;

// border and shadow
-(void)applyEffectCircleSilverBorder;
-(void)applyEffectRoundRectSilverBorder;
-(void)applyEffectRoundRectShadow;
-(void)applyEffectShadowAndBorder;

// animation
-(void)applyBounceAnimation;
-(void)applyBounceAnimationWithDuration:(float)aDuration;

@end
