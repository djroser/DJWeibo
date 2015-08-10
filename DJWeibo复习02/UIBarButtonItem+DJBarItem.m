//
//  UIBarButtonItem+DJBarItem.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/10.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "UIBarButtonItem+DJBarItem.h"
#import "UIImage+DJweibo.h"
@implementation UIBarButtonItem (DJBarItem)


+(UIBarButtonItem *)ItemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon target:(id)target action:(SEL )action
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:highlightedIcon] forState:UIControlStateHighlighted];
    button.bounds=CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
