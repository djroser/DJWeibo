//
//  WBTabBar.h
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBTabBar;
@protocol WBTabBarDelegate <NSObject>

@optional
-(void)tabBar:(WBTabBar *)tabBar didSelectedItemFrom:( long int )from to:(long int)to;

@end

@interface WBTabBar : UIView

-(void)addTabBarItem:(UITabBarItem *)item;
@property(nonatomic,weak)UIButton *WBTabBarADDButton;
@property(nonatomic,weak)id<WBTabBarDelegate>delegate;

@end
