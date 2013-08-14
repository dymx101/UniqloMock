//
//  UIView+AddOn.m
//  Gagein
//
//  Created by Dong Yiming on 5/22/13.
//  Copyright (c) 2013 gagein. All rights reserved.
//

#import "UIView+AddOn.h"
#import "MBProgressHUD.h"
#include <objc/runtime.h>

static char kGGAssociateKeyTagNumber;
static char kGGAssociateKeyData;

static MBProgressHUD * hud;

@implementation UIView (AddOn)

@dynamic tagNumber;
@dynamic data;

-(void)setData:(id)data
{
    objc_setAssociatedObject(self, &kGGAssociateKeyData, data, OBJC_ASSOCIATION_COPY);
}

-(id)data
{
    return objc_getAssociatedObject(self, &kGGAssociateKeyData);
}

- (void)setTagNumber:(NSNumber *)tagNumber
{
    objc_setAssociatedObject(self, &kGGAssociateKeyTagNumber, tagNumber, OBJC_ASSOCIATION_COPY);

}

-(NSNumber *)tagNumber
{
    return objc_getAssociatedObject(self, &kGGAssociateKeyTagNumber);
}


-(void)showLoadingHUD
{
//    [hud hide:YES];
//    hud = [GGAlert showLoadingHUDInView:self];
}

-(void)showLoadingHUDWithOffsetY:(float)aOffsetY
{
//    [hud hide:YES];
//    hud = [GGAlert showLoadingHUDWithOffsetY:aOffsetY inView:self];
}

-(void)showLoadingHUDWithOffset:(CGSize)aOffset
{
//    [hud hide:YES];
//    hud = [GGAlert showLoadingHUDWithOffset:aOffset inView:self];
}


-(void)showLoadingHUDWithTitle:(NSString *)aTitle
{
//    [hud hide:YES];
//    hud = [GGAlert showLoadingHUDWithTitle:aTitle inView:self];
}

-(void)showLoadingHUDWithText:(NSString *)aText
{
//    [hud hide:YES];
//    hud = [GGAlert showLoadingHUDWithMessage:aText inView:self];
}

-(void)hideLoadingHUD
{
     [hud hide:YES];
}

-(void)hideAllHUDs
{
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
}

-(void)removeAllGestureRecognizers
{
    for (UIGestureRecognizer *gest in self.gestureRecognizers)
    {
        [self removeGestureRecognizer:gest];
    }
}

-(void)goTop
{
    [self.superview bringSubviewToFront:self];
}

-(UIView *)ancestorView
{
    UIView *ancestor = self.superview;
    UIView *realAncestor = ancestor;
    while (ancestor)
    {
        realAncestor = ancestor;
        ancestor = realAncestor.superview;
    }
    
    return realAncestor;
}

-(void)printViewsTree
{
    [self _doPrintViewsTreeWithLevel:0];
}

-(void)_doPrintViewsTreeWithLevel:(NSUInteger)aLevel
{
    NSMutableString *str = [NSMutableString string];
    for (int i = 0; i < aLevel; i++)
    {
        [str appendString:@"  "];
    }
    [str appendString:@"|--"];
    
    DLog(@"%@%@", str, [self class]);
    
    for (UIView *sub in self.subviews)
    {
        [sub _doPrintViewsTreeWithLevel:aLevel + 1];
    }
}

-(void)centerMeHorizontally
{
    [self centerMeHorizontallyChangeMyWidth:self.frame.size.width];
}

-(void)centerMeHorizontallyChangeMyWidth:(CGFloat)aWidth
{
    CGRect myRc = self.frame;
    myRc.size.width = aWidth;
    myRc.origin.x = (self.superview.frame.size.width - aWidth) / 2;
    self.frame = myRc;
}

-(void)resignAllResponders
{
    [self resignFirstResponder];
    
    for (UIView *subView in self.subviews)
    {
        [subView resignAllResponders];
    }
}

-(float)maxHeightForContent
{
    float maxHeight = 0.f;
    for (UIView *subView in self.subviews)
    {
        float subMaxH = CGRectGetMaxY(subView.frame);
        maxHeight = MAX(maxHeight, subMaxH);
    }
    
    return maxHeight;
}

-(void)adjustHeightToFitContent
{
    CGRect thisRc = self.frame;
    thisRc.size.height = [self maxHeightForContent];
    self.frame = thisRc;
}

-(void)setPos:(CGPoint)aNewPos
{
    CGRect thisRc = self.frame;
    thisRc.origin = aNewPos;
    self.frame = thisRc;
}

-(void)setPosX:(float)aX
{
    CGRect thisRc = self.frame;
    thisRc.origin.x = aX;
    self.frame = thisRc;
}

-(void)setPosY:(float)aY
{
    CGRect thisRc = self.frame;
    thisRc.origin.y = aY;
    self.frame = thisRc;
}

-(void)setHeight:(float)aNewHeight
{
    CGRect thisRc = self.frame;
    thisRc.size.height = aNewHeight;
    self.frame = thisRc;
}

-(void)setWidth:(float)aNewWidth
{
    CGRect thisRc = self.frame;
    thisRc.size.width = aNewWidth;
    self.frame = thisRc;
}

-(UIImage *)myPicture
{
    UIGraphicsBeginImageContext(self.bounds.size);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return viewImage;
}

-(NSString *)frameString
{
    return NSStringFromCGRect(self.frame);
}

+(float)HEIGHT
{
    return 0.f;
}

+(float)WIDTH
{
    return 0.f;
}

#pragma mark - effect
-(void)applyEffectCircleSilverBorder
{
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.borderColor = GGSharedColor.silver.CGColor;
    self.layer.borderWidth = 1.f;
    self.layer.masksToBounds = YES;
}

-(void)applyEffectRoundRectSilverBorder
{
    self.layer.cornerRadius = 5;
    self.layer.borderColor = GGSharedColor.silver.CGColor;
    self.layer.borderWidth = 1;
    self.layer.masksToBounds = YES;
}

-(void)applyEffectRoundRectShadow
{
    self.layer.cornerRadius = 8;
    self.layer.shadowColor = GGSharedColor.darkGray.CGColor;
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowRadius = 4;
    self.layer.shadowOpacity = .1f;
    self.layer.masksToBounds = NO;
}

-(void)applyEffectShadowAndBorder
{
    self.layer.borderColor = GGSharedColor.silver.CGColor;
    self.layer.borderWidth = 1;
    
    self.layer.shadowColor = GGSharedColor.gray.CGColor;
    self.layer.shadowOpacity = .1f;
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowRadius = 2.f;
}


#define  BOUNCE_ANIM_DURATION   (.2f)
-(void)applyBounceAnimation
{
    [self applyBounceAnimationWithDuration:BOUNCE_ANIM_DURATION];
}

-(void)applyBounceAnimationWithDuration:(float)aDuration
{
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @(0);
    opacityAnimation.toValue = @(1);
    opacityAnimation.duration = aDuration;
    [self.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
    CAKeyframeAnimation *alertScaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D startingScale = CATransform3DScale(self.layer.transform, 0, 0, 0);
    CATransform3D overshootScale = CATransform3DScale(self.layer.transform, 1.05, 1.05, 1.0);
    CATransform3D undershootScale = CATransform3DScale(self.layer.transform, 0.95, 0.95, 1.0);
    CATransform3D endingScale = self.layer.transform;
    
    alertScaleAnimation.values = @[
                                   [NSValue valueWithCATransform3D:startingScale],
                                   [NSValue valueWithCATransform3D:overshootScale],
                                   [NSValue valueWithCATransform3D:undershootScale],
                                   [NSValue valueWithCATransform3D:endingScale]
                                   ];
    
    alertScaleAnimation.keyTimes = @[
                                     @(0.0f),
                                     @(0.3f),
                                     @(0.85f),
                                     @(1.0f)
                                     ];
    
    alertScaleAnimation.timingFunctions = @[
                                            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                            ];
    alertScaleAnimation.fillMode = kCAFillModeForwards;
    alertScaleAnimation.removedOnCompletion = NO;
    
    CAAnimationGroup *alertAnimation = [CAAnimationGroup animation];
    alertAnimation.animations = @[
                                  alertScaleAnimation,
                                  opacityAnimation
                                  ];
    alertAnimation.duration = aDuration * 2;
    [self.layer addAnimation:alertAnimation forKey:@"alertAnimation"];
}

-(void)applyBounceOutAnimation
{
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @(1);
    opacityAnimation.toValue = @(0);
    opacityAnimation.duration = BOUNCE_ANIM_DURATION;
    [self.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
    CAKeyframeAnimation *alertScaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D startingScale = self.layer.transform;//CATransform3DScale(self.layer.transform, 0.95, 0.95, 1.0);//CATransform3DScale(self.layer.transform, 0, 0, 0);
    CATransform3D overshootScale = CATransform3DScale(self.layer.transform, 1.05, 1.05, 1.0);
    CATransform3D undershootScale = CATransform3DScale(self.layer.transform, 0.95, 0.95, 1.0); //CATransform3DScale(self.layer.transform, 0.95, 0.95, 1.0);
    CATransform3D endingScale = CATransform3DScale(self.layer.transform, 0, 0, 0);//self.layer.transform;
    
    alertScaleAnimation.values = @[
                                   [NSValue valueWithCATransform3D:startingScale],
                                   [NSValue valueWithCATransform3D:overshootScale],
                                   [NSValue valueWithCATransform3D:undershootScale],
                                   [NSValue valueWithCATransform3D:endingScale]
                                   ];
    
    alertScaleAnimation.keyTimes = @[
                                     @(0.0f),
                                     @(0.3f),
                                     @(0.85f),
                                     @(1.0f)
                                     ];
    
    alertScaleAnimation.timingFunctions = @[
                                            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                            ];
    alertScaleAnimation.fillMode = kCAFillModeForwards;
    alertScaleAnimation.removedOnCompletion = NO;
    
    CAAnimationGroup *alertAnimation = [CAAnimationGroup animation];
    alertAnimation.animations = @[
                                  alertScaleAnimation,
                                  opacityAnimation
                                  ];
    alertAnimation.duration = BOUNCE_ANIM_DURATION * 2;
    [self.layer addAnimation:alertAnimation forKey:@"alertAnimation"];
}

@end
