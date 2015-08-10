//
//  DJSearchBar.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/10.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "DJSearchBar.h"
#import "UIImage+DJweibo.h"

@interface DJSearchBar()
@property(nonatomic,weak)UIImageView *lefticon;

@end
@implementation DJSearchBar

+(instancetype)searchBar
{
    return [[self alloc]init];
}

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
    
    //背景
    
    self.background=[UIImage imageResizeWithName:@"searchbar_textfield_background"];
    
    self.frame=CGRectMake(0, 0, 300, 30);
    //左边的图标
    UIImageView *lefticon=[[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
    
    lefticon.contentMode=UIViewContentModeCenter;
        lefticon.frame=CGRectMake(0, 0, 30, self.frame.size.height);
    self.lefticon=lefticon;
    self.leftView=lefticon;
    self.leftViewMode=UITextFieldViewModeAlways;
    
    //字体
    self.font=[UIFont systemFontOfSize:12];
    
    //提示语
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName]=[UIColor grayColor];
    self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"搜索" attributes:attrs];
    
        self.returnKeyType=UIReturnKeySearch;
        self.enablesReturnKeyAutomatically=YES;
        self.clearButtonMode=UITextFieldViewModeAlways;
    
    }
    return self;
}

//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    self.lefticon.frame=CGRectMake(0, 0, 30, self.frame.size.height);
//}

@end
