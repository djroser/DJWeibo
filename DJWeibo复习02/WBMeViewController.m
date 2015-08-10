//
//  WBMeViewController.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBMeViewController.h"
#import "DJSearchBar.h"
@implementation WBMeViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    DJSearchBar *bar=[DJSearchBar searchBar];
    bar.frame=CGRectMake(100, 0, 100, 30);
    self.navigationItem.titleView=bar;
    
}

@end
