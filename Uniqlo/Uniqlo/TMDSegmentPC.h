//
//  TMDSegmentPC.h
//  Uniqlo
//
//  Created by towne on 13-8-17.
//  Copyright (c) 2013年 Dong Yiming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDBaseVC.h"

@protocol TMDSegmentPCDelegate; 

@interface TMDSegmentPC : TMDBaseVC

/// Keeps an array of the controllers managed by this container controller
@property (nonatomic, copy) NSArray *viewControllers;
/// Reference to the currently selected controller
@property (nonatomic, weak) UIViewController *selectedViewController;
/// Index of the currently selected controller
@property (nonatomic, assign) NSUInteger selectedIndex;
/// Optional delegate that can be informed of a new selection and decide
/// whether a page can or can't be selected
@property (nonatomic, weak) id <TMDSegmentPCDelegate> delegate;

@property (nonatomic, strong) UIView   *headerContainerView;
@property (nonatomic, strong) UISegmentedControl  *segmentedControl;
@property (nonatomic, strong) UIView     *contentContainerView;

- (void)setSelectedIndex:(NSUInteger)index animated:(BOOL)animated;
- (void)setSelectedViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end


/**
 * The delegate protocol for TMDSegmentPC.
 */
@protocol TMDSegmentPCDelegate <NSObject>
@optional
/**
 * Delegate can decide if the page should be selected or not.  Default implementation is YES.
 * @return NO if the page shouldn't be selected
 * @param segmentPageController the JCMSegmentPageController generating this call
 * @param viewController the view controller (page) to decide if should or shouldn't be selected
 * @param index the index of this page within the container
 */
- (BOOL)segmentPageController:(TMDSegmentPC *)segmentPageController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index;
/**
 * Delegate gets notified after the page was selected.
 * @param segmentPageController the JCMSegmentPageController generating this call
 * @param viewController the view controller (page) that was selected
 * @param index the index of this page within the container
 */
- (void)segmentPageController:(TMDSegmentPC *)segmentPageController didSelectViewController:(UIViewController *)viewController atIndex:(NSUInteger)index;
@end
