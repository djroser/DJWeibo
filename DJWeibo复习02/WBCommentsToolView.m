//
//  WBCommentsToolView.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/5/17.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBCommentsToolView.h"
#import "UIImage+DJweibo.h"
#import "WBStatus.h"

@interface WBCommentsToolView()
/* 转发按钮数组**/
@property(nonatomic,strong) NSMutableArray * Btns;
/* 分割线数组**/
@property(nonatomic,strong) NSMutableArray * breakLines;

/* 转发按钮**/
@property(nonatomic,weak) UIButton *reweetBtn;
/* 评论按钮**/
@property(nonatomic,weak) UIButton *CommentBtn;
/* 点赞按钮**/
@property(nonatomic,weak) UIButton *niceBtn;

/* 分割线1**/
@property(nonatomic,weak) UIImageView *breakLine;

/* 分割线2**/
@property(nonatomic,weak) UIImageView *breakLine2;


@end
@implementation WBCommentsToolView

-(id)initWithFrame:(CGRect)frame
{
        if (self=[super initWithFrame:frame]) {
            
            self.userInteractionEnabled=YES;
            [self setupAllButton];
            
            [self setupAllBreakLine];
            
            
            self.image=[UIImage imageResizeWithName: @"timeline_card_bottom_background"];
            self.highlightedImage=[UIImage imageResizeWithName:@"timeline_card_bottom_background_highlighted"];
    }
    return self;
}

-(NSMutableArray *)Btns
{
    if (_Btns==nil) {
       
        _Btns=[NSMutableArray array];
        
    }
    return _Btns;
}

-(NSMutableArray *)breakLines
{
    if (_breakLines==nil) {
        _breakLines=[NSMutableArray array];
    }
    return _breakLines;
}




//初始化所有的按钮
-(void)setupAllButton
{
    self.reweetBtn=[self ButtonWithTitle:@"转发" image:@"timeline_icon_retweet" bgimage:@"timeline_card_leftbottom_highlighted"];
    
    
    self.CommentBtn=[self ButtonWithTitle:@"评论" image:@"timeline_icon_comment" bgimage:@"timeline_card_middlebottom_highlighted"];
    
    
    self.niceBtn=[self ButtonWithTitle:@"赞" image:@"timeline_icon_unlike" bgimage:@"timeline_card_rightbottom_highlighted"];
    

}

//初始化单个按钮
-(UIButton *)ButtonWithTitle:(NSString *)title image:(NSString *)image bgimage:(NSString *)bgimage
{
    UIButton *Btn=[[UIButton alloc]init];
    [Btn setImage:[UIImage imageWithName:image] forState:UIControlStateNormal];
    [Btn setBackgroundImage:[UIImage imageWithName:bgimage] forState:UIControlStateHighlighted];
    [Btn setTitle:title forState:UIControlStateNormal];
    Btn.titleLabel.font=[UIFont systemFontOfSize:13];
    Btn.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
    [Btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [self addSubview:Btn];
    
    [self.Btns addObject:Btn];
    
    return Btn;
}

//初始化所有分割线
-(void)setupAllBreakLine
{
    [self setupOneBreakLine];
    
    [self setupOneBreakLine];
    
    
}

/**初始化单个分割线*/
-(void)setupOneBreakLine
{
    UIImageView *breakLine=[[UIImageView alloc]init];
    breakLine.image=[UIImage imageResizeWithName:@"timeline_card_bottom_line"];
    [breakLine setContentMode:UIViewContentModeTop];
    
    [self addSubview:breakLine];
    [self.breakLines addObject:breakLine];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger BtnCounts=self.Btns.count;
//    NSLog(@"%ld",(long)BtnCounts);
    
    CGFloat BreakLCounts=self.breakLines.count;
    CGFloat breakLW=2;
    CGFloat toolW=(self.frame.size.width - BreakLCounts * breakLW) / BtnCounts;
    CGFloat toolH=self.frame.size.height;
    
//    NSLog(@"%f----%f",toolW,toolH);
    CGFloat btnX;
    CGFloat btnY=0;
    //设置Btn的frame
    for (int i=0; i<BtnCounts; i++) {
        
        UIButton *btn=self.Btns[i];
        btnX= toolW * i;
        btn.frame=CGRectMake(btnX, btnY, toolW, toolH);
        
    }
    
    CGFloat breakY=btnY;
    CGFloat breakH=toolH;
    CGFloat breakX;
    for (int j=0; j<BreakLCounts; j++) {
        UIButton *btn=self.Btns[j];
        breakX=CGRectGetMaxX(btn.frame);
        
        UIImageView *breakLine=self.breakLines[j];
        breakLine.frame=CGRectMake(breakX, breakY, breakLW, breakH);
    }
    
    
//    CGFloat toolW=105;
//    CGFloat toolH=36;
//    
//    CGFloat reweetX=0;
//    CGFloat reweetY=0;
//    
//    
//    self.reweetBtn.frame=CGRectMake(reweetX, reweetY, toolW, toolH);
//    
//    CGFloat breakLX=CGRectGetMaxX(self.reweetBtn.frame);
//    CGFloat breakLY=0;
//    CGFloat breakLW=1;
//    CGFloat breakLH=30;
//    
//    
//    self.breakLine.frame=CGRectMake(breakLX, breakLY, breakLW, breakLH);
//    
//    CGFloat commentX=CGRectGetMaxX(self.breakLine.frame);
//    self.CommentBtn.frame=CGRectMake(commentX, 0, toolW, toolH);
//    
//    
//    CGFloat breakLine2X=CGRectGetMaxX(self.CommentBtn.frame);
//    self.breakLine2.frame=CGRectMake(breakLine2X, breakLY, breakLW, breakLH);
//    
//    
//    CGFloat niceX=CGRectGetMaxX(self.breakLine2.frame) ;
//    self.niceBtn.frame=CGRectMake(niceX, 0, toolW, toolH);
    
    
    
}


-(void)setWbstatus:(WBStatus *)wbstatus
{
    _wbstatus=wbstatus;
    
   
//    NSLog(@"%d-----",repostCount);
    [self setButtonTitle:self.reweetBtn OriginalTitle:@"转发" count:wbstatus.reposts_count];
    [self setButtonTitle:self.CommentBtn OriginalTitle:@"评论" count:wbstatus.comments_count];
    [self setButtonTitle:self.niceBtn OriginalTitle:@"赞" count:wbstatus.attitudes_count];
    
    
}

-(void)setButtonTitle:(UIButton *)Btn OriginalTitle:(NSString *)originalTitle count:(int)count
{
    
    if (count) {
        NSString *title=nil;
        if (count<10000) {
            title=[NSString stringWithFormat:@"%d",count];
            
        }else{
            double doubleCount=count /10000.0;
            title=[NSString stringWithFormat:@"%lf万",doubleCount];
            
        }
        [Btn setTitle:title forState:UIControlStateNormal];
        
    }else{
        [Btn setTitle:originalTitle forState:UIControlStateNormal];
    }

}






@end
