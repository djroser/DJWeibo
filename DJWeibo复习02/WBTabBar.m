//
//  WBTabBar.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBTabBar.h"
#import "WBTabBarButton.h"
#import "UIImage+DJweibo.h"
@interface WBTabBar()
@property(nonatomic,weak)WBTabBarButton *selectbutton;

@property(nonatomic,strong)NSMutableArray *tabbarButtons;
@end
@implementation WBTabBar

-(NSMutableArray *)tabbarButtons
{
    if (_tabbarButtons==nil) {
        _tabbarButtons=[NSMutableArray array];
    }
    return _tabbarButtons;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        UIButton *addBtn=[[UIButton alloc]init];
        [addBtn setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [addBtn setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [addBtn setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [addBtn setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        addBtn.bounds=CGRectMake(0, 0, addBtn.currentBackgroundImage.size.width, addBtn.currentBackgroundImage.size.height);
        
        
        
        [self addSubview:addBtn];
        self.WBTabBarADDButton=addBtn;
    }
    return self;
}




-(void)addTabBarItem:(UITabBarItem *)item
{
    WBTabBarButton *button=[[WBTabBarButton alloc]init];
    
    [self addSubview:button];
    [self.tabbarButtons addObject:button];
    
    button.item=item;
    
    
    [button addTarget:self action:@selector(ClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    if (self.tabbarButtons.count==1) {
        [self ClickBtn:button];
    }
   
}

-(void)ClickBtn:(WBTabBarButton *)button
{

    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedItemFrom:to:)]) {
        
        [self.delegate tabBar:self didSelectedItemFrom:self.selectbutton.tag to:button.tag];
        
    }
    
    self.selectbutton.selected=NO;
    button.selected=YES;
    self.selectbutton=button;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat addBtnX=self.frame.size.width * 0.5;
    CGFloat addBtnY=self.frame.size.height * 0.5;
    self.WBTabBarADDButton.center=CGPointMake(addBtnX, addBtnY);
    
    CGFloat buttonY=0;
    CGFloat buttonW=self.frame.size.width / self.subviews.count;
    CGFloat buttonH=self.frame.size.height;
    
    for (int index=0; index<self.tabbarButtons.count; index++) {
        
        
        WBTabBarButton *button=self.tabbarButtons[index];
        CGFloat buttonX=index * buttonW;
        if (index>1) {
            buttonX=(index + 1) * buttonW;
        }
        
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag=index;
    }
}










@end
