//
//  WBTabBarButton.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//
#define WBTabBarButtondivide 0.6
#import "WBTabBarButton.h"
#import "UIImage+DJweibo.h"
#import "WBTabBadgeButton.h"
@interface WBTabBarButton()
@property(nonatomic,weak)WBTabBadgeButton *badgeButton;
@end
@implementation WBTabBarButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        WBTabBadgeButton *badgeButton=[[WBTabBadgeButton alloc]init];
//        [badgeButton setBackgroundImage:[UIImage imageResizeWithName: @"main_badge"] forState:UIControlStateNormal];
//        badgeButton.userInteractionEnabled=NO;
//        badgeButton.titleLabel.font=[UIFont systemFontOfSize:11];
        self.badgeButton=badgeButton;
        [self addSubview:badgeButton];
        
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    }
    return self;
    
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX=0;
    CGFloat titleY=contentRect.size.height * WBTabBarButtondivide;
    CGFloat titleH=contentRect.size.height * (1 - WBTabBarButtondivide);
    CGFloat titleW=contentRect.size.width;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX=0;
    CGFloat imageY=0;
    CGFloat imageH=contentRect.size.height * WBTabBarButtondivide;
    CGFloat imageW=contentRect.size.width;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    [self.item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [self.item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];

    [self.item addObserver:self forKeyPath:@"title" options:0 context:nil];

    [self.item addObserver:self forKeyPath:@"image" options:0 context:nil];
   

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    self.badgeButton.badgeValue=self.item.badgeValue;
//    if (_item.badgeValue) {
//        self.badgeButton.hidden=NO;
//        
//        [self.badgeButton setTitle:_item.badgeValue forState:UIControlStateNormal];
//        CGSize textSize=[_item.badgeValue sizeWithFont:self.badgeButton.titleLabel.font];
//        
//        CGFloat badgeX=50;
//        CGFloat badgeY=0;
//        CGFloat badgeW=textSize.width + 10;
//        CGFloat badgeH=textSize.height+ 5 ;
//        
//        if (_item.badgeValue.length==1) {
//            badgeW=self.badgeButton.currentBackgroundImage.size.width;
//            
//            badgeH=self.badgeButton.currentBackgroundImage.size.height;
//        }
//        self.badgeButton.frame=CGRectMake(badgeX, badgeY, badgeW, badgeH);
//    }else{
//        self.badgeButton.hidden=YES;
//    }

}

-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
}

@end
