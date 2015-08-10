//
//  UIImage+DJweibo.h
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DJweibo)

+(UIImage *)imageWithName:(NSString *)image;

+(UIImage *)imageResizeWithName:(NSString *)image;

+(UIImage *)imageResizeWithName:(NSString *)image width:(CGFloat )width height:(CGFloat)height;
@end
