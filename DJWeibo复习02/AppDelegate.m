//
//  AppDelegate.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "AppDelegate.h"
#import "WBTabBarController.h"
#import "WBNewfeatureViewController.h"
#import "OAuthViewController.h"
#import "WBChooseRootVcTool.h"
#import "WBAccountTool.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    //取出数据
    WBCount *account=[WBAccountTool Account];
    NSLog(@"%@",account);
    
    //判断是否存有登录信息
    if (!account) {
       
        self.window.rootViewController=[[OAuthViewController alloc]init];

    }else{
        //iOS8下，卸载app并不会删除defaults的数据，所以演示时需要手动清除数据
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//        [defaults removeObjectForKey:@"CFBundleVersion"];
//        [defaults synchronize];
        
        NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        
        //选择根控制器
        [WBChooseRootVcTool Choose:defaults];

    }
    
    
    
    
    

    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
