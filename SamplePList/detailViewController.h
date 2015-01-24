//
//  detailViewController.h
//  SamplePList
//
//  Created by Eriko Ichinohe on 2015/01/22.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

@property (nonatomic,strong)NSArray *friendsList;
@property (nonatomic,strong)NSString *areaString;

@property (weak, nonatomic) IBOutlet UITextView *FriendsName;
@property (weak, nonatomic) IBOutlet UILabel *areaName;

@end
