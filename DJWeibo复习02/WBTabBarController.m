//
//  WBTabBarController.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBTabBarController.h"
#import "WBHomeViewController.h"
#import "WBMessageViewController.h"
#import "WBMeViewController.h"
#import "WBDiscoverViewController.h"
#import "UIImage+DJweibo.h"
#import "WBTabBar.h"
#import "WBNavgationController.h"
#import "WBWriteMessageViewController.h"

@interface WBTabBarController()<WBTabBarDelegate>
@property(nonatomic,weak)WBTabBar *cusTabbar;

@end
@implementation WBTabBarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTabBar];
    [self setupAllchildViewController];
    
    
}

-(void)setupTabBar
{
    WBTabBar *wbtabBar=[[WBTabBar alloc]init];
    wbtabBar.delegate=self;
    [wbtabBar.WBTabBarADDButton addTarget:self action:@selector(WriteNewMessage) forControlEvents:UIControlEventTouchUpInside];
    wbtabBar.frame=self.tabBar.bounds;
    [self.tabBar addSubview:wbtabBar];
    self.cusTabbar=wbtabBar;
}

-(void)WriteNewMessage
{
    
    WBWriteMessageViewController *WtrteVc=[[WBWriteMessageViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:WtrteVc];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}

-(void)tabBar:(WBTabBar *)tabBar didSelectedItemFrom:(long)from to:(long)to
{
    NSLog(@"%ld--%ld",from,to);
    self.selectedIndex=to;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
    
}
-(void)setupchildVc:(UIViewController *)child title:(NSString *)title image:(NSString *)image selectedimage:(NSString *)selectedimage
{
    child.title=title;
    child.tabBarItem.image=[UIImage imageWithName:image];
    child.tabBarItem.selectedImage=[UIImage imageWithName:selectedimage];
    WBNavgationController *nav=[[WBNavgationController alloc]initWithRootViewController:child];
    [self addChildViewController:nav];
    
    [self.cusTabbar addTabBarItem:child.tabBarItem];
}

-(void)setupAllchildViewController
{
    WBHomeViewController *homeVc=[[WBHomeViewController alloc]init];
    homeVc.tabBarItem.badgeValue=@"1";
    homeVc.view.backgroundColor=[UIColor whiteColor];
    [self setupchildVc:homeVc title:@"主页" image:@"tabbar_home" selectedimage:@"tabbar_home_selected"];
    
    WBMessageViewController *messageVc=[[WBMessageViewController alloc]init];
    messageVc.view.backgroundColor=[UIColor whiteColor];
    messageVc.tabBarItem.badgeValue=@"1";
    [self setupchildVc:messageVc title:@"消息" image:@"tabbar_message_center" selectedimage:@"tabbar_message_center_selected"];
    
    WBDiscoverViewController *discoverVc=[[WBDiscoverViewController alloc]init];
    
    discoverVc.tabBarItem.badgeValue=@"99";
    [self setupchildVc:discoverVc title:@"发现" image:@"tabbar_discover" selectedimage:@"tabbar_discover_selected"];
    
    WBMeViewController *meVc=[[WBMeViewController alloc]init];
    meVc.view.backgroundColor=[UIColor yellowColor];
    meVc.tabBarItem.badgeValue=@"199";
    [self setupchildVc:meVc title:@"我" image:@"tabbar_profile" selectedimage:@"tabbar_profile_selected"];
}

@end
