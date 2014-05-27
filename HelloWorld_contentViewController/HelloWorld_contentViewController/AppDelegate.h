//
//  AppDelegate.h
//  HelloWorld_contentViewController
//
//  Created by vcj013 on 2014/05/27.
//  Copyright (c) 2014年 geechs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) UIViewController *viewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
