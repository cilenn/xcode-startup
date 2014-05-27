//
//  ViewController.m
//  HelloWorld02
//
//  Created by Ito Atsushi on 2014/05/26.
//  Copyright (c) 2014年 Ito Atsushi. All rights reserved.
//

#import "ViewController.h"

// 定数の定義
#define HELLO_WORLD_STRING @"Hello World!"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad.");
    
    /*
     * mutable = 変更可能という意味です。
     */
    
    /* -----------------------------------------------------
     * ディクショナリーの利用
     */
    //NSDictionary* dict = @{};
    
    // ディクショナリーの作成
    NSMutableDictionary* dict = @{}.mutableCopy;
    
    // キーと値をセット
    [dict setObject:@"春" forKey:@"spring"];
    [dict setObject:@"夏" forKey:@"summer"];
    [dict setObject:@"秋" forKey:@"autumn"];
    [dict setObject:@"冬" forKey:@"winter"];
    NSLog(@"%@", dict);
    
    // キーを元に結果を取得
    NSLog(@"%@", [dict objectForKey:@"summer"]);
    
    // キーを元に削除
    [dict removeObjectForKey:@"summer"];
    NSLog(@"%@", dict);
    
    // 全てのデータを削除
    [dict removeAllObjects];
    NSLog(@"%@", dict);
    
    /* -----------------------------------------------------
     * 配列の利用
     */
    //NSArray* array = @[];
    
    // 配列の作成
    NSMutableArray* array = @[].mutableCopy;
    
    // 値をセット
    [array addObject:@"春"];
    [array addObject:@"夏"];
    [array addObject:@"秋"];
    [array addObject:@"冬"];
    NSLog(@"%@", array);
    
    // インデックスを元に結果を取得
    NSLog(@"%@", [array objectAtIndex:1]);
    
    // インデックスを元に削除
    [array removeObjectAtIndex:1];
    NSLog(@"%@", array);
    
    // 全てのデータを削除
    [array removeAllObjects];
    NSLog(@"%@", array);
    
    
    /* -----------------------------------------------------
     * UILabelの設置
     * storyboardからの参照を廃止しています。
     */
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,200,100)];
    label.center   = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    label.text     = HELLO_WORLD_STRING;
    label.font     = [UIFont fontWithName:@"Optima" size:12.0f];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor greenColor];
    
    /*
    // 文字色を設定する場合
    NSDictionary *stringAttributes =
  @{ NSForegroundColorAttributeName : [UIColor blueColor],
     NSFontAttributeName : [UIFont systemFontOfSize:24.0f] };
    NSAttributedString *string =
    [[NSAttributedString alloc] initWithString:HELLO_WORLD_STRING attributes:stringAttributes];
    label.attributedText =string;
    */
    
    [self.view addSubview:label];
    
    
    
    /* -----------------------------------------------------
     * UIAlertViewの設置
     * .hファイルにて UIAlertViewDelegate をデリゲートしています。
     */
    
    /*
    UIAlertView* alert = UIAlertView.new;
    alert.title = @"お知らせ";
    alert.message = @"完了しました";
    [alert addButtonWithTitle:@"確認"];
    */
    
    UIAlertView* alert =
    [[UIAlertView alloc] initWithTitle:@"確認"
                               message:@"削除してもよろしいですか？"
                              delegate:self
                     cancelButtonTitle:@"いいえ"
                     otherButtonTitles:@"はい", nil];
     
     [alert show];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSLog(@"viewWillAppear");
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            //１番目のボタンが押されたときの処理を記述する
            NSLog(@"0");
            
            break;
        case 1:
            //２番目のボタンが押されたときの処理を記述する
            NSLog(@"1");
            
            break;
    }
    
}
@end
