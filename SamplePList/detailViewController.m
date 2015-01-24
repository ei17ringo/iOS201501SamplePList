//
//  detailViewController.m
//  SamplePList
//
//  Created by Eriko Ichinohe on 2015/01/22.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //ナビゲーションコントローラのタイトルを設定
    self.navigationItem.title = [NSString stringWithFormat:@"%@の友達",self.areaString];
    
    
    //エリア名を表示する
    self.areaName.text = [NSString stringWithFormat:@"%@の友達",self.areaString];
    
    
    //友達リストを表示する
    
    //
    NSMutableAttributedString *ColorStr = [[NSMutableAttributedString alloc] init];     //全部
    NSAttributedString *ColorStrTmp;    //１行分
                               
    NSString *strNameList = @"";
    
    //高速列挙でデータを取り出して文字列変数にセット
    for (NSDictionary *friendDic in self.friendsList) {
        strNameList = [strNameList stringByAppendingString:friendDic[@"Name"]];
        strNameList = [strNameList stringByAppendingString:@" "];
        strNameList = [strNameList stringByAppendingString:friendDic[@"Age"]];
        strNameList = [strNameList stringByAppendingString:@" "];
        strNameList = [strNameList stringByAppendingString:friendDic[@"Gender"]];
        strNameList = [strNameList stringByAppendingString:@"\n"];
        
        //性別で色を変える
        UIColor *genderColor;
        if ([friendDic[@"Gender"] isEqualToString:@"男"]) {
            //ダークグリーン #006400
            genderColor = [UIColor colorWithRed:0 green:0.392156 blue:0 alpha:1.0];
        }else{
            //ホットピンク #ff69b4
            genderColor = [UIColor colorWithRed:1 green:0.411764 blue:0.705882 alpha:1.0];
        }
        
        //性別によって異なる色を指定した変数と表示したい文字変数を指定（ついでにちょっと文字を大きくしてます)
        ColorStrTmp = [[NSAttributedString alloc] initWithString:strNameList                                                                  attributes:@{                                                                               NSForegroundColorAttributeName : genderColor,                                                                                                                                                                                                                                                                                                                                                                                                                                  NSFontAttributeName : [UIFont boldSystemFontOfSize:20]}
            ];
        [ColorStr appendAttributedString:ColorStrTmp];
        strNameList = @"";
    }
    
    self.FriendsName.attributedText = ColorStr;
    
    NSLog(@"%@",strNameList);
    //self.FriendsName.text = strNameList;
    
    if (self.friendsList.count == 0) {
        self.FriendsName.text = @"友達の登録がありません";
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
