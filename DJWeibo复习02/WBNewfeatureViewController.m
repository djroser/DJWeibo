//
//  WBNewfeatureViewController.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/13.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBNewfeatureViewController.h"
#import "UIImage+DJweibo.h"
#import "WBTabBarController.h"
#import "AppDelegate.h"
#define WBNewfeatureImageCount 3
#define WBNewfeatureImageW self.scrollView.frame.size.width
#define WBNewfeatureImageH self.scrollView.frame.size.height
@interface WBNewfeatureViewController()<UIScrollViewDelegate>
@property(nonatomic,weak)UIPageControl *pageControl;

@end
@implementation WBNewfeatureViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupScrollView];
    
    [self setupPageControl];
    
    
    
}

-(void)setupPageControl
{
    UIPageControl *pageControl=[[UIPageControl alloc]init];
    pageControl.numberOfPages=WBNewfeatureImageCount;
    CGFloat pageX=self.view.frame.size.width * 0.5 - 50;
    CGFloat pageY=self.view.frame.size.height -70;
    CGFloat pageW=100;
    CGFloat pageH=70;
    pageControl.frame=CGRectMake(pageX, pageY, pageW, pageH);
    pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:234.0/255.0 green:96.0/255.0 blue:40.0/255.0 alpha:1.0];
    pageControl.pageIndicatorTintColor=[UIColor colorWithRed:189.0/255.0 green:189.0/255.0 blue:189.0/255.0 alpha:1.0];
    
    [self.view addSubview:pageControl];
    self.pageControl=pageControl;
}



-(void)setupScrollView
{
    //添加Scrollview
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=self.view.bounds;
    [self.view addSubview:scrollView];
    scrollView.delegate=self;
    
    //设置背景色
    scrollView.backgroundColor=[UIColor colorWithRed:246 green:246 blue:246 alpha:0.7];
    
    
    
    //添加图片
    CGFloat imageY=0;
    CGFloat imageW=scrollView.frame.size.width;
    CGFloat imageH=scrollView.frame.size.height;
    
    for (int index=0; index<WBNewfeatureImageCount; index++) {
        
        UIImageView *imageView=[[UIImageView alloc]init];
        imageView.userInteractionEnabled=YES;
        
        NSString *name=[NSString stringWithFormat:@"new_feature_%d",index+1 ];
        
        imageView.image=[UIImage imageWithName:name];
        
        CGFloat imageX=index * imageW;
        imageView.frame=CGRectMake(imageX, imageY, imageW, imageH);
        
        
        if (index==WBNewfeatureImageCount-1) {
            
            [self SetupLastImage:imageView];
            
            
        }
        
        
        
        
        [scrollView addSubview:imageView];
    }
    
    scrollView.contentSize=CGSizeMake(imageW * WBNewfeatureImageCount, 0);
    scrollView.pagingEnabled=YES;
    scrollView.showsHorizontalScrollIndicator=NO;

}

-(void)ClickShareBtn:(UIButton *)shareBtn
{
    NSLog(@"ClickShareBtn");
    shareBtn.selected= ! shareBtn.isSelected;
    
}

-(void)SetupLastImage:(UIImageView *)imageView
{
    //添加开始微博按钮
    UIButton *BeginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [BeginBtn setTitle:@"开始体验" forState:UIControlStateNormal];
    [BeginBtn setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [BeginBtn setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [BeginBtn addTarget:self action:@selector(ClickBeginBtn) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat BeginW=BeginBtn.currentBackgroundImage.size.width;
    CGFloat BeginH=BeginBtn.currentBackgroundImage.size.height;
    
    CGFloat BeginX= imageView.frame.size.width * 0.5 - BeginW * 0.5;
    CGFloat BeginY=imageView.frame.size.height * 0.5 - BeginH * 0.5 +80;
    
    BeginBtn.frame=CGRectMake(BeginX, BeginY, BeginW, BeginH);
    
    //添加分享按钮
    UIButton *shareBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给好友" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    shareBtn.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 10);
    
    [shareBtn addTarget:self action:@selector(ClickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    CGFloat shareX=imageView.frame.size.width * 0.5 -100;
    CGFloat shareY=imageView.frame.size.height * 0.5 +30;
    CGFloat shareW=200;
    CGFloat shareH=30;
    
    shareBtn.frame=CGRectMake(shareX, shareY, shareW, shareH);
    

    
    [imageView addSubview:BeginBtn];
    [imageView addSubview:shareBtn];
   

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double doublePage=scrollView.contentOffset.x / scrollView.frame.size.width;
    int page=(int)(doublePage + 0.5);
    self.pageControl.currentPage=page;
}

-(void)ClickBeginBtn
{
    
    WBTabBarController *tab=[[WBTabBarController alloc]init];
    self.view.window.rootViewController=tab;
}



@end
