//
//  WBTabBadgeButton.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/8.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBTabBadgeButton.h"
#import "UIImage+DJweibo.h"
@implementation WBTabBadgeButton


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundImage:[UIImage imageResizeWithName: @"main_badge"] forState:UIControlStateNormal];
        self.userInteractionEnabled=NO;
        self.titleLabel.font=[UIFont systemFontOfSize:11];
        

        
    }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue=[badgeValue copy];
    
    if (self.badgeValue) {
        self.hidden=NO;
        
        [self setTitle:self.badgeValue forState:UIControlStateNormal];
        CGSize textSize=[self.badgeValue sizeWithFont:self.titleLabel.font];
        
        CGFloat badgeX=40;
        CGFloat badgeY=0;
        CGFloat badgeW=textSize.width + 10;
        CGFloat badgeH=textSize.height+ 5 ;
        
        if (self.badgeValue.length==1) {
            badgeW=self.currentBackgroundImage.size.width;
            
            badgeH=self.currentBackgroundImage.size.height;
        }
        self.frame=CGRectMake(badgeX, badgeY, badgeW, badgeH);
    }else{
        self.hidden=YES;
    }

}

@end
