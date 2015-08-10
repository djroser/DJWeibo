//
//  UIBarButtonItem+DJBarItem.h
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/10.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (DJBarItem)
+(UIBarButtonItem *)ItemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon target:(id)target action:(SEL )action;
@end
