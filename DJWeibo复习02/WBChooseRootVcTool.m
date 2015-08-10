//
//  WBChooseRootVcTool.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/17.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBChooseRootVcTool.h"
#import "WBNewfeatureViewController.h"
#import "WBTabBarController.h"
@implementation WBChooseRootVcTool



+(void)Choose:(NSUserDefaults *)defaults
{
    NSString *key=@"CFBundleVersion";
    
    if (defaults==nil) {
        NSUserDefaults *newdefaults=[NSUserDefaults standardUserDefaults];
        defaults=newdefaults;
    }
    
    
    NSString *lastVersion=[defaults stringForKey:key];
    
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[key];
    
    
    if ([currentVersion isEqualToString:lastVersion]) {
        [UIApplication sharedApplication].keyWindow.rootViewController=[[WBTabBarController alloc]init];
    }else
    {
        [UIApplication sharedApplication].keyWindow.rootViewController=[[WBNewfeatureViewController alloc]init];
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
    }

}

    
@end
