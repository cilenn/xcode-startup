//
//  ModelController.h
//  PageBaseTest
//
//  Created by Ito Atsushi on 2014/07/08.
//  Copyright (c) 2014年 Ito Atsushi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
