//
//  RootViewController.h
//  PageBaseTest
//
//  Created by Ito Atsushi on 2014/07/08.
//  Copyright (c) 2014年 Ito Atsushi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
