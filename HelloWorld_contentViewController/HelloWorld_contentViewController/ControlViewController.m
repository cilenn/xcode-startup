//
//  ControlViewController.m
//  HelloWorld_contentViewController
//
//  Created by vcj013 on 2014/05/27.
//  Copyright (c) 2014年 geechs. All rights reserved.
//

#import "ControlViewController.h"

@interface ControlViewController ()

@end

@implementation ControlViewController

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
    
    UIButton *start_btn = UIButton.new;
    start_btn.frame = CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height);
    start_btn.backgroundColor = [UIColor whiteColor];
    start_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [start_btn setTitle:@"start" forState:UIControlStateNormal];
    [start_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [start_btn addTarget:self action:@selector(startMusic:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:start_btn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startMusic:(id)sender
{
    NSLog(@"start music. %@", sender);
}


@end
