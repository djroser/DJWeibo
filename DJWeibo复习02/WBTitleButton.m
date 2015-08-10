//
//  WBTitleButton.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/12.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBTitleButton.h"
#import "UIImage+DJweibo.h"

#define WBTitleButtonImageX self.frame.size.width - 30
@implementation WBTitleButton

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageResizeWithName:@"navigationbar_background"] forState:UIControlStateHighlighted];
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentRight;
        self.adjustsImageWhenHighlighted=NO;

    }
    
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX=self.frame.size.width - 30;
    CGFloat imageY=0;
    CGFloat imageW=30;
    CGFloat imageH=self.frame.size.height;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
    
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX=0;
    CGFloat titleY=0;
    CGFloat titleW=WBTitleButtonImageX;
    CGFloat titleH=self.frame.size.height;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}


@end
