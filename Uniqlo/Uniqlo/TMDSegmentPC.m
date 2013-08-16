//
//  TMDSegmentPC.m
//  Uniqlo
//
//  Created by towne on 13-8-17.
//  Copyright (c) 2013年 Dong Yiming. All rights reserved.
//

#import "TMDSegmentPC.h"
#import "JBTabBarController.h"

static const float TAB_BAR_HEIGHT = 65.0f;

@interface TMDSegmentPC ()

@end

@implementation TMDSegmentPC
{
	UIView             *headerContainerView;
    UISegmentedControl *segmentedControl;
	UIView             *contentContainerView;
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
    [segmentedControl removeAllSegments];
}

- (void)addSegments {
	NSUInteger index = 0;
	for (UIViewController *viewController in self.viewControllers) {
        //        [segmentedControl insertSegmentWithTitle:viewController.title atIndex:index animated:NO];
        if (index == _selectedIndex)
        {
            NSString *label = viewController.title;
            UIImage *image =  [self drawText:@"Some text"
                                           inImage:[UIImage imageNamed:@"tabsel"]
                                           atPoint:CGPointMake(0, 0)];
            [segmentedControl insertSegmentWithImage:image atIndex:index animated:NO];
        }
        else
        {
            NSString *label = viewController.title;
            UIImage *image =  [self drawText:@"Some text"
                                     inImage:[UIImage imageNamed:@"tabunsel"]
                                     atPoint:CGPointMake(0, 0)];
            [segmentedControl insertSegmentWithImage:image atIndex:index animated:NO];
        }
		++index;
	}
}

-(void)resetAllSegmentsBackImage
{
	NSUInteger index = 0;
	for (UIViewController *viewController in self.viewControllers) {
        [segmentedControl setImage:[UIImage imageNamed:@"tabunsel"] forSegmentAtIndex:index];
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
    segmentedControl.frame = CGRectInset(rect, 5.0, 5.0);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
	CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, TAB_BAR_HEIGHT);
	headerContainerView = [[UIView alloc] initWithFrame:rect];
	headerContainerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    headerContainerView.backgroundColor = GGSharedColor.silver;
    CGRect segmentedControlRect = CGRectInset(rect, 5.0, 5.0);
    segmentedControl = [[UISegmentedControl alloc] initWithFrame:segmentedControlRect];
    segmentedControl.momentary = NO;
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [segmentedControl addTarget:self action:@selector(tabButtonPressed:) forControlEvents:UIControlEventValueChanged];
    
    [headerContainerView addSubview:segmentedControl];
	[self.view addSubview:headerContainerView];
    
	rect.origin.y = TAB_BAR_HEIGHT;
	rect.size.height = self.view.bounds.size.height - TAB_BAR_HEIGHT;
	contentContainerView = [[UIView alloc] initWithFrame:rect];
	contentContainerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:contentContainerView];
    
	[self reloadTabButtons];
}

- (void)viewDidUnload {
	[super viewDidUnload];
	headerContainerView = nil;
	contentContainerView = nil;
	segmentedControl = nil;
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
	[self setSelectedIndex:newSelectedIndex animated:NO];
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
            [segmentedControl setSelectedSegmentIndex:_selectedIndex];
            [segmentedControl setImage:[UIImage imageNamed:@"tabsel"] forSegmentAtIndex:_selectedIndex];
			toViewController = self.selectedViewController;
		}
        
		if (toViewController == nil) { // don't animate
			[fromViewController.view removeFromSuperview];
		}
		else if (fromViewController == nil) { // don't animate
			toViewController.view.frame = contentContainerView.bounds;
			[contentContainerView addSubview:toViewController.view];
            
			if ([self.delegate respondsToSelector:@selector(segmentPageController:didSelectViewController:atIndex:)])
				[self.delegate segmentPageController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
		} else if (animated) {
			CGRect rect = contentContainerView.bounds;
			if (oldSelectedIndex < newSelectedIndex)
				rect.origin.x = rect.size.width;
			else
				rect.origin.x = -rect.size.width;
            
			toViewController.view.frame = rect;
			headerContainerView.userInteractionEnabled = NO;
            
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
                                        toViewController.view.frame = contentContainerView.bounds;
                                    }
                                    completion:^(BOOL finished) {
                                        headerContainerView.userInteractionEnabled = YES;
                                        
                                        if ([self.delegate respondsToSelector:@selector(segmentPageController:didSelectViewController:atIndex:)])
                                            [self.delegate segmentPageController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
                                    }];
		} else { // not animated
			[fromViewController.view removeFromSuperview];
            
			toViewController.view.frame = contentContainerView.bounds;
			[contentContainerView addSubview:toViewController.view];
            
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

-(UIImage*) drawText:(NSString*) text
             inImage:(UIImage*)  image
             atPoint:(CGPoint)   point
{
    
    UIFont *font = [UIFont boldSystemFontOfSize:12];
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    CGRect rect = CGRectMake(point.x, point.y, image.size.width, image.size.height);
    [[UIColor blackColor] set];
    [text drawInRect:CGRectIntegral(rect) withFont:font];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
