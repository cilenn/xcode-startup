//
//  ViewController.m
//  HelloWorld_contentViewController
//
//  Created by vcj013 on 2014/05/27.
//  Copyright (c) 2014年 geechs. All rights reserved.
//

#import "ViewController.h"

#import "TableViewController.h"
#import "ControlViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // テーブルビュー
    TableViewController *table_vc = TableViewController.new;
    table_vc.view.backgroundColor = [UIColor grayColor];
    [self addChildViewController:table_vc];
    //table_vc.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y,
    //                                 self.view.frame.size.width, (self.view.frame.size.height - 50.0f));
    table_vc.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y,
                                     self.view.frame.size.width, (self.view.frame.size.height));
    
    
    [self.view addSubview:table_vc.view];
    [table_vc didMoveToParentViewController:self];
    
    
    // コントロールビュー
    ControlViewController *control_vc = ControlViewController.new;
    control_vc.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:control_vc];
    control_vc.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.size.height-50.0f),
                                     self.view.frame.size.width, 50.0f);
    [self.view addSubview:control_vc.view];
    [control_vc didMoveToParentViewController:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
