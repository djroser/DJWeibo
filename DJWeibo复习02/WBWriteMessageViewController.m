//
//  WBWriteMessageViewController.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/12.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBWriteMessageViewController.h"

@implementation WBWriteMessageViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"发微博";
    
    UIBarButtonItem *leftBtn=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(ClickLeftBtn)];
    
    UIBarButtonItem *rightBtn=[[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(ClickRightBtn)];
    
    
//    [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
//    [leftBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//    [leftBtn addTarget:self action:@selector(ClickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.navigationItem.leftBarButtonItem=leftBtn;
    self.navigationItem.rightBarButtonItem=rightBtn;
}

-(void)ClickLeftBtn
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)ClickRightBtn
{
    
}

@end
