//
//  UIImage+DJweibo.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "UIImage+DJweibo.h"

@implementation UIImage (DJweibo)

+(UIImage *)imageWithName:(NSString *)image
{
    if ([[UIDevice currentDevice].systemVersion doubleValue]>=7.0) {
        NSString *newimage=[image stringByAppendingString:@"_os7"];
        UIImage *imageview=[UIImage imageNamed:newimage];
        
        if (imageview==nil) {
            return [UIImage imageNamed:image];
        }
        return imageview;
    }
    return [UIImage imageNamed:image];
}


+(UIImage *)imageResizeWithName:(NSString *)image
{
    UIImage *newImage=[UIImage imageWithName:image];
    
    return [newImage stretchableImageWithLeftCapWidth:newImage.size.width * 0.5 topCapHeight:newImage.size.height * 0.5 ];
}

+(UIImage *)imageResizeWithName:(NSString *)image width:(CGFloat )width height:(CGFloat)height
{
    UIImage *newImage=[UIImage imageWithName:image];
    
    
    
    return [newImage stretchableImageWithLeftCapWidth:width topCapHeight:height ];
}





@end
