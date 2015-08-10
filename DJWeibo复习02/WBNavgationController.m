//
//  WBNavgationController.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/8.
//  Copyright (c) 2015年 丁健. All rights reserved.
//
#define iOS7 [[UIDevice currentDevice].systemVersion doubleValue]>=7.0
#import "WBNavgationController.h"
#import "UIImage+DJweibo.h"
@implementation WBNavgationController

+(void)initialize
{
    [self setupNavBarTheme];
    
    [self setupBarItemTheme];
    
    
}

+(void)setupNavBarTheme
{
    UINavigationBar *navBar=[UINavigationBar appearance];
    //ios6中需要设置
    if (!iOS7) {
        [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleDefault
        ;
        
    }
    
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName]=[UIFont boldSystemFontOfSize:19];
    textAttrs[NSForegroundColorAttributeName]=[UIColor blackColor];
    [navBar setTitleTextAttributes:textAttrs];
}

+(void)setupBarItemTheme
{
    UIBarButtonItem *barItem=[UIBarButtonItem appearance];
    if (!iOS7) {
        [barItem setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [barItem setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [barItem setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    textAttrs[NSForegroundColorAttributeName]=[UIColor orangeColor];
    [barItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed=YES;
    }
    
    [super pushViewController:viewController animated:animated];
}
@end
