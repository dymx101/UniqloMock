//
//  TMDSegmentPC.m
//  Uniqlo
//
//  Created by towne on 13-8-17.
//  Copyright (c) 2013年 Dong Yiming. All rights reserved.
//

#import "TMDSegmentPC.h"
#import "JBTabBarController.h"

static const float TAB_BAR_HEIGHT = 67.0f;

@interface TMDSegmentPC ()

@end

@implementation TMDSegmentPC
{

}

@synthesize viewControllers  = _viewControllers;
@synthesize selectedIndex    = _selectedIndex;
@synthesize delegate         = _delegate;



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

- (void)removeAllSegments {
    [self.segmentedControl removeAllSegments];
}

- (void)addSegments {
	NSUInteger index = 0;
	for (UIViewController *viewController in self.viewControllers) {
        //        [segmentedControl insertSegmentWithTitle:viewController.title atIndex:index animated:NO];
        if (index == _selectedIndex)
        {
            NSString *imgName = [NSString stringWithFormat:@"tabsel_%d",_selectedIndex];
            [self.segmentedControl insertSegmentWithImage:[UIImage imageNamed:imgName] atIndex:index animated:NO];
        }
        else
        {
            NSString *imgName = [NSString stringWithFormat:@"tabunsel_%d",index];
            [self.segmentedControl insertSegmentWithImage:[UIImage imageNamed:imgName] atIndex:index animated:NO];
        }
		++index;
	}
}

-(void)resetAllSegmentsBackImage
{
	NSUInteger index = 0;
	for (UIViewController *viewController in self.viewControllers) {
        NSString *imgName = [NSString stringWithFormat:@"tabunsel_%d",index];
        [self.segmentedControl setImage:[UIImage imageNamed:imgName] forSegmentAtIndex:index];
		++index;
	}
}

- (void)reloadTabButtons {
	[self removeAllSegments];
    [self addSegments];
    NSUInteger lastIndex = _selectedIndex;
	_selectedIndex       = NSNotFound;
	self.selectedIndex   = lastIndex;
    // TODO -- Do I need this???

}

- (void)layoutHeaderView {
	CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, TAB_BAR_HEIGHT);
    self.segmentedControl.frame = CGRectInset(rect, 5.0, 5.0);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
	CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, TAB_BAR_HEIGHT);
	self.headerContainerView = [[UIView alloc] initWithFrame:rect];
	self.headerContainerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.headerContainerView.backgroundColor = GGSharedColor.silver;
    CGRect segmentedControlRect = CGRectInset(rect, 5.0, 5.0);
    self.segmentedControl = [[UISegmentedControl alloc] initWithFrame:segmentedControlRect];
    self.segmentedControl.momentary = NO;
    self.segmentedControl.segmentedControlStyle = 6;
    
    [self.segmentedControl addTarget:self action:@selector(tabButtonPressed:) forControlEvents:UIControlEventValueChanged];
    
    [self.headerContainerView addSubview:self.segmentedControl];
	[self.view addSubview:self.headerContainerView];
    
	rect.origin.y = TAB_BAR_HEIGHT;
	rect.size.height = self.view.bounds.size.height - TAB_BAR_HEIGHT;
	self.contentContainerView = [[UIView alloc] initWithFrame:rect];
	self.contentContainerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:self.contentContainerView];
    
	[self reloadTabButtons];
}

- (void)viewDidUnload {
	[super viewDidUnload];
	self.headerContainerView = nil;
	self.contentContainerView = nil;
	self.segmentedControl = nil;
}

- (void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];
	[self layoutHeaderView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Only rotate if all child view controllers agree on the new orientation.
	for (UIViewController *viewController in self.viewControllers) {
		if (![viewController shouldAutorotateToInterfaceOrientation:interfaceOrientation])
			return NO;
	}
	return YES;
}

- (void)setViewControllers:(NSArray *)newViewControllers {
	NSAssert([newViewControllers count] >= 2, @"JCMSegmentPageController requires at least two view controllers");
    
	UIViewController *oldSelectedViewController = self.selectedViewController;
    
	// Remove the old child view controllers.
	for (UIViewController *viewController in _viewControllers) {
		[viewController willMoveToParentViewController:nil];
		[viewController removeFromParentViewController];
	}
    
	_viewControllers = [newViewControllers copy];
    
	// This follows the same rules as UITabBarController for trying to
	// re-select the previously selected view controller.
	NSUInteger newIndex = [_viewControllers indexOfObject:oldSelectedViewController];
	if (newIndex != NSNotFound)
		_selectedIndex = newIndex;
	else if (newIndex < [_viewControllers count])
		_selectedIndex = newIndex;
	else
		_selectedIndex = 0;
    
	// Add the new child view controllers.
	for (UIViewController *viewController in _viewControllers) {
		[self addChildViewController:viewController];
		[viewController didMoveToParentViewController:self];
	}
    
	if ([self isViewLoaded])
		[self reloadTabButtons];
}

- (void)setSelectedIndex:(NSUInteger)newSelectedIndex {
	[self setSelectedIndex:newSelectedIndex animated:YES];
}

- (void)setSelectedIndex:(NSUInteger)newSelectedIndex animated:(BOOL)animated {
	NSAssert(newSelectedIndex < [self.viewControllers count], @"View controller index out of bounds");
    
	if ([self.delegate respondsToSelector:@selector(segmentPageController:shouldSelectViewController:atIndex:)]) {
		UIViewController *toViewController = [self.viewControllers objectAtIndex:newSelectedIndex];
		if (![self.delegate segmentPageController:self shouldSelectViewController:toViewController atIndex:newSelectedIndex])
			return;
	}
    
	if (![self isViewLoaded]) {
		_selectedIndex = newSelectedIndex;
	}
	else if (_selectedIndex != newSelectedIndex) {
		UIViewController *fromViewController = nil;
		UIViewController *toViewController = nil;
        
		NSUInteger oldSelectedIndex = _selectedIndex;
		_selectedIndex = newSelectedIndex;
        
		if (_selectedIndex != NSNotFound) {
            [self resetAllSegmentsBackImage];
            [self.segmentedControl setSelectedSegmentIndex:_selectedIndex];
            NSString *imgName = [NSString stringWithFormat:@"tabsel_%d",_selectedIndex];
            [self.segmentedControl setImage:[UIImage imageNamed:imgName] forSegmentAtIndex:_selectedIndex];
			toViewController = self.selectedViewController;
		}
        
		if (toViewController == nil) { // don't animate
			[fromViewController.view removeFromSuperview];
		}
		else if (fromViewController == nil) { // don't animate
			toViewController.view.frame = self.contentContainerView.bounds;
			[self.contentContainerView addSubview:toViewController.view];
            
			if ([self.delegate respondsToSelector:@selector(segmentPageController:didSelectViewController:atIndex:)])
				[self.delegate segmentPageController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
		}
        else if (animated) {
			CGRect rect = self.contentContainerView.bounds;
			if (oldSelectedIndex < newSelectedIndex)
				rect.origin.x = rect.size.width;
			else
				rect.origin.x = -rect.size.width;
            
			toViewController.view.frame = rect;
			self.headerContainerView.userInteractionEnabled = NO;
            
			[self transitionFromViewController:fromViewController
                              toViewController:toViewController
                                      duration:0.3
                                       options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionCurveEaseOut
                                    animations:^ {
                                        CGRect rect = fromViewController.view.frame;
                                        if (oldSelectedIndex < newSelectedIndex)
                                            rect.origin.x = -rect.size.width;
                                        else
                                            rect.origin.x = rect.size.width;
                                        
                                        fromViewController.view.frame = rect;
                                        toViewController.view.frame = self.contentContainerView.bounds;
                                    }
                                    completion:^(BOOL finished) {
                                        self.headerContainerView.userInteractionEnabled = YES;
                                        
                                        if ([self.delegate respondsToSelector:@selector(segmentPageController:didSelectViewController:atIndex:)])
                                            [self.delegate segmentPageController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
                                    }];
		} else { // not animated
			[fromViewController.view removeFromSuperview];
            
			toViewController.view.frame = self.contentContainerView.bounds;
			[self.contentContainerView addSubview:toViewController.view];
            
			if ([self.delegate respondsToSelector:@selector(segmentPageController:didSelectViewController:atIndex:)])
				[self.delegate segmentPageController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
		}
	}
}

- (UIViewController *)selectedViewController {
	if (self.selectedIndex != NSNotFound)
		return [self.viewControllers objectAtIndex:self.selectedIndex];
	else
		return nil;
}

- (void)setSelectedViewController:(UIViewController *)newSelectedViewController {
	[self setSelectedViewController:newSelectedViewController animated:NO];
}

- (void)setSelectedViewController:(UIViewController *)newSelectedViewController animated:(BOOL)animated;
{
	NSUInteger index = [self.viewControllers indexOfObject:newSelectedViewController];
	if (index != NSNotFound)
		[self setSelectedIndex:index animated:animated];
}

- (void)tabButtonPressed:(UISegmentedControl *)sender {
	[self setSelectedIndex:sender.selectedSegmentIndex animated:YES];
}

@end
