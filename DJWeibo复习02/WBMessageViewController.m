//
//  WBMessageViewController.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBMessageViewController.h"
#import "WBTabBadgeButton.h"

@implementation WBMessageViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    WBTabBadgeButton *badgeBtn=[[WBTabBadgeButton alloc]init];
    badgeBtn.badgeValue=@"1";
    badgeBtn.center=CGPointMake(50, 100);
    

//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 300, 260)];
//    label.text = @"Label Text Content, This is a text label things attribute";//默认为空
//    label.font = [UIFont systemFontOfSize:17];//默认使用系统的17
//    
//    
//    //富文本的基本数据类型，属性字符串。以此为基础，如果这个设置了相应的属性，则会忽略上面设置的属性，默认为空
//    NSString *string = label.text;
//    const CGFloat fontSize = 16.0;
//    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
//    NSUInteger length = [string length];
//    //设置字体
//    UIFont *baseFont = [UIFont systemFontOfSize:fontSize];
//    [attrString addAttribute:NSFontAttributeName value:baseFont range:NSMakeRange(0, length)];//设置所有的字体
//    
//    
//    
//                label.numberOfLines = 2;
//    NSMutableParagraphStyle *
//    style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    
//    style.firstLineHeadIndent = 20;//首行头缩进
//    
//    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, length)];
//    
//    [attrString addAttribute:NSKernAttributeName value:@2 range:NSMakeRange(0, length)];//字符间距 2pt
//    
//    label.attributedText = attrString;
//    
//    
//    
//    [self.view addSubview:label];
    
    [self.view addSubview:badgeBtn];
}
@end
