//
//  CalcViewController.m
//  CalcSample
//
//  Created by Ito Atsushi on 2014/07/08.
//  Copyright (c) 2014年 Ito Atsushi. All rights reserved.
//

#import "CalcViewController.h"
#import <QuartzCore/QuartzCore.h> // ボタンに枠線をつけます。
@interface CalcViewController ()
{
    UILabel *viewer;
    NSArray *figures;
}
@end

@implementation CalcViewController

- (instancetype)init
{
    self =  [super init];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // 1) Viewを上下に分割します。
    UIView *console = [UIView new];
    console.frame = CGRectMake(0,20, self.view.frame.size.width, 160.0f);
    console.backgroundColor = [UIColor colorWithRed:252.0/255.0
                                              green:194.0/255.0 blue:0 alpha:1.0];
    [self.view addSubview:console];
    
    
    // 5) 数値の結果を反映できるようにします。
    //    -> UILabelを追加する
    viewer = [UILabel new];
    viewer.frame = CGRectMake(0,80, self.view.frame.size.width, 80.0f);
    viewer.text  = @"12,345";
    viewer.textAlignment = NSTextAlignmentRight;
    viewer.font = [UIFont fontWithName:@"Times New Roman" size:38.0f];
    viewer.tag = 99;
    [console addSubview:viewer];
    
    UIView *control = [UIView new];
    control.frame = CGRectMake(0,160, self.view.frame.size.width, 320.0f);
    control.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:control];
    
    
    // 2) UIButtonを一個作ります。横(320を四等分したサイズ)
    const float btn_rect_size = self.view.frame.size.width/4;
    
    // 4) ループします。
    // a. 配列の作成 ※ クラス変数に設定
    // b. forの作成
    // c. ボタンを動的に配置 4x4にする
    figures = @[@"7",@"8",@"9",@"÷",
                @"4",@"5",@"6",@"x",
                @"1",@"2",@"3",@"+",
                @"0",@".",@"C",@"-",
                ];
    
    int x = 0;
    int y = 0;
    for(int i=0;i<[figures count];i++){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];

        // ボタン配置の仕組み
        if(i!=0){
            x = x + btn_rect_size;
            if(i%4==0){
                x = 0;
                y = y + btn_rect_size;
            }
        }
        
        btn.frame = CGRectMake(x,y, btn_rect_size, btn_rect_size);
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        btn.layer.borderWidth = 1.0f;
        btn.tag = i; // indexを設定
        [btn setTitle:[figures objectAtIndex:i] forState:UIControlStateNormal];
        //btn.titleLabel.textColor = [UIColor blackColor];
        [btn addTarget:self action:@selector(doCalc:) forControlEvents:UIControlEventTouchUpInside];
        [control addSubview:btn];
        /*
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(0,0, btn_rect_size, btn_rect_size);
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        btn.layer.borderWidth = 1.0f;
        btn.tag = 10;
        [btn setTitle:@"+" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(doCalc:) forControlEvents:UIControlEventTouchUpInside];
        [control addSubview:btn];
        */
    }

}

// 3) senderの設置を行います。
// ※ [sender tag] で値を取得できることを確認する
-(void)doCalc:(id)sender
{
    NSLog(@"doCalc");
    NSLog(@"%@", sender);
    NSLog(@"%d", [sender tag]);
    

    switch(viewer.tag){
        case 3:
            viewer.text = [NSString stringWithFormat:@"%d", (int)viewer.text/(int)[figures objectAtIndex:[sender tag]]];
            viewer.tag = 99;
            break;
        default:
            if([sender tag] == 14){
                viewer.text = @"0";
                viewer.tag = 99;
            }else{
                viewer.text = [NSString stringWithFormat:@"%@%@", viewer.text, [figures objectAtIndex:[sender tag]]];
                viewer.tag = [sender tag];
            }
            break;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
