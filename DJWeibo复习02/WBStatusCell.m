//
//  WBStatusCell.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/19.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBStatusCell.h"
#import "WBStatus.h"
#import "WBstatusUsr.h"
#import "WBStatusFrame.h"
#import "UIImageView+WebCache.h"
#import "UIImage+DJweibo.h"
#import "WBCommentsToolView.h"
@interface WBStatusCell()

/** 整体微博 */
@property(nonatomic,weak)UIImageView *topView;

/** 用户头像 */
@property(nonatomic,weak)UIImageView *iconView;

/** 用户会员 */
@property(nonatomic,weak)UIImageView *vipView;

/** 微博配图 */
@property(nonatomic,weak)UIImageView *articleView;

/** 用户名 */
@property(nonatomic,weak) UILabel *nameLabel;

/** 发送时间 */
@property(nonatomic,weak) UILabel *timeLabel;

/** 来源 */
@property(nonatomic,weak) UILabel *fromLabel;

/** 正文 */
@property(nonatomic,weak) UILabel *articleLabel;



/** 被转发微博（父控件） */
@property(nonatomic,weak)UIImageView *retweetedView;

/** 被转发用户 */
@property(nonatomic,weak) UILabel *retweetnameLabel;

/** 转发微博配图 */
@property(nonatomic,weak)UIImageView *retweetpicView;

/**  转发微博文字 */
@property(nonatomic,weak) UILabel *retweetLabel;


/** 评论工具条 */
@property(nonatomic,weak)WBCommentsToolView *CommentToolBar;

@end


@implementation WBStatusCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"WBcell";
    
    WBStatusCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
        cell=[[WBStatusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
    return cell;

}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupTopView];
        
        [self setupCommentToolBar];
        
        [self setupRetweetedView];
    }
    
    return self;
}


-(void)setStatusFrame:(WBStatusFrame *)statusFrame
{
    _statusFrame=statusFrame;
    
    [self setNormalData];
    
    [self setRetViewData];
    
    [self setToolBarData];
}



-(void)setupTopView
{
    /** 整体微博 */
    UIImageView *topView=[[UIImageView alloc]init];
    topView.image=[UIImage imageResizeWithName:@"timeline_card_top_background"];
    topView.highlightedImage=[UIImage imageResizeWithName:@"timeline_card_top_background_highlighted"];
    [self.contentView addSubview:topView];
    self.topView=topView;
    
    
    /** 用户头像 */
    UIImageView *iconView=[[UIImageView alloc]init];
    [self.topView addSubview:iconView];
    self.iconView=iconView;
    
    
    /** 用户会员 */
    UIImageView *vipView=[[UIImageView alloc]init];
    [self.topView addSubview:vipView];
    self.vipView=vipView;
   
    
    /** 微博配图 */
    UIImageView *articleView=[[UIImageView alloc]init];
    [self.topView addSubview:articleView];
    self.articleView=articleView;
  
    
    /** 用户名 */
    UILabel *nameLabel=[[UILabel alloc]init];
    nameLabel.font=WBStatusCellNameSize;
    nameLabel.numberOfLines=0;
    [self.topView addSubview:nameLabel];
    self.nameLabel=nameLabel;
  
    
    /** 发送时间 */
    UILabel *timeLabel=[[UILabel alloc]init];
    timeLabel.font=WBStatusCellcreate_atSize;
//    timeLabel.numberOfLines=0;
    [self.topView addSubview:timeLabel];
    self.timeLabel=timeLabel;
    
    
    /** 来自 */
    UILabel *fromLabel=[[UILabel alloc]init];
    fromLabel.font=WBStatusCellcreate_atSize;
    fromLabel.numberOfLines=0;
    [self.topView addSubview:fromLabel];
    self.fromLabel=fromLabel;
   
    
    /** 正文 */
    UILabel *articleLabel=[[UILabel alloc]init];
    articleLabel.font=WBStatusCellTextSize;
    articleLabel.numberOfLines=0;
    [self.topView addSubview:articleLabel];
    self.articleLabel=articleLabel;
    

}

/** 初始化转发微博*/
-(void)setupRetweetedView
{
    /** 被转发微博（父控件） */
    UIImageView *retweetedView=[[UIImageView alloc]init];
    retweetedView.image=[UIImage imageResizeWithName:@"timeline_image_placeholder"];
    retweetedView.userInteractionEnabled=YES;
    [self.topView addSubview:retweetedView];
    self.retweetedView=retweetedView;
    
    
    /** 被转发用户 */
    UILabel *retweetnameLabel=[[UILabel alloc]init];
    retweetnameLabel.font=WBStatusCellretweetSize;
    retweetnameLabel.numberOfLines=0;
    retweetnameLabel.textColor=[UIColor blueColor];
    [self.retweetedView addSubview:retweetnameLabel];
    self.retweetnameLabel=retweetnameLabel;
    

    
    /** 转发微博配图 */
    UIImageView *retweetpicView=[[UIImageView alloc]init];
    [self.retweetedView addSubview:retweetpicView];
    self.retweetpicView=retweetpicView;
   
    
    /**  转发微博文字 */
    UILabel *retweetLabel=[[UILabel alloc]init];
    retweetLabel.font=WBStatusCellretweetSize;
    retweetLabel.numberOfLines=0;
    [self.retweetedView addSubview:retweetLabel];
    self.retweetLabel=retweetLabel;
    

}


/** 初始化评论转发工具条*/
-(void)setupCommentToolBar
{
    /** 评论工具条 */
    WBCommentsToolView *CommentToolBar=[[WBCommentsToolView alloc]init];
//    CommentToolBar.image=[UIImage imageResizeWithName: @"timeline_card_bottom_background"];
//    CommentToolBar.highlightedImage=[UIImage imageResizeWithName:@"timeline_card_bottom_background_highlighted"];
    
    [self.contentView addSubview:CommentToolBar];
    self.CommentToolBar=CommentToolBar;
    
}


-(void)setFrame:(CGRect)frame
{
    frame.size.height -= 10;
    
    [super setFrame:frame];
}

-(void)setNormalData
{
    /** 整体微博 */
    self.topView.frame=self.statusFrame.topF;
    
    
    /** 用户头像 */
    self.iconView.frame=self.statusFrame.iconF;
    NSURL *iconUrl=[NSURL URLWithString:self.statusFrame.status.user.profile_image_url];
    [self.iconView setImageWithURL:iconUrl placeholderImage:[UIImage imageWithName:@"icon"]];
    
    /** 用户名 */
    self.nameLabel.frame=self.statusFrame.nameF;
    self.nameLabel.text=self.statusFrame.status.user.name;
    
    /** 用户会员 */
    self.vipView.frame=self.statusFrame.vipF;
    if (self.statusFrame.status.user.mbtype!=0) {
        
        self.vipView.hidden=NO;
        self.vipView.image=[UIImage imageWithName:[NSString stringWithFormat:@"common_icon_membership_level%d",self.statusFrame.status.user.mbrank]];
        self.vipView.frame=self.statusFrame.vipF;
        self.nameLabel.textColor=[UIColor orangeColor];
    }else
    {
        self.vipView.hidden=YES;
        self.nameLabel.textColor=[UIColor blackColor];
    }
    
    /** 发送时间 */
    self.timeLabel.frame=self.statusFrame.created_atF;
    self.timeLabel.text=self.statusFrame.status.created_at;
    
    /** 来源 */
    self.fromLabel.frame=self.statusFrame.sourceF;
    self.fromLabel.text=self.statusFrame.status.source;
    
    /** 正文 */
    self.articleLabel.frame=self.statusFrame.textF;
    self.articleLabel.text=self.statusFrame.status.text;
    
    /** 微博配图 */
    self.articleView.frame=self.statusFrame.thumbnail_picF;
    NSURL *articleUrl=[NSURL URLWithString:self.statusFrame.status.thumbnail_pic];
    [self.articleView setImageWithURL:articleUrl placeholderImage:[UIImage imageWithName:@"icon"]];
    
    //转发微博背景
    
    
    
}


-(void)setRetViewData
{
    
    /** 被转发微博（父控件） */
    self.retweetedView.frame=self.statusFrame.retweetedViewF;
    
    
    /** 被转发用户 */
    self.retweetnameLabel.frame=self.statusFrame.retweetnameF;
    NSString *nameLabelText=[[NSString alloc]initWithFormat:@"@%@",self.statusFrame.status.retweeted_status.user.name ];
    self.retweetnameLabel.text=nameLabelText;
    /**  转发微博文字 */
    self.retweetLabel.frame=self.statusFrame.retweetLabelF;
    CGFloat retnameLength=self.statusFrame.retweetnameF.origin.x + self.statusFrame.retweetnameF.size.width;
    
    NSString *string = [[NSString alloc]initWithFormat:@"%@",_statusFrame.status.retweeted_status.text];
//    NSLog(@"%@",string);
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
//    NSLog(@"attrString--%@",attrString);
    NSUInteger length = [string length];
   
    self.retweetLabel.numberOfLines = 0;
    NSMutableParagraphStyle *
    style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    
    style.firstLineHeadIndent = retnameLength;//首行头缩进
    
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, length)];
    
    
    
    self.retweetLabel.attributedText =attrString;
    
    
    
    

   
    

    
    
//    self.retweetLabel.text= _statusFrame.status.retweeted_status.text;
    
    
    
    /** 转发微博配图 */
    self.retweetpicView.frame=self.statusFrame.retweetpicF;
    [self.retweetpicView setImageWithURL:[NSURL URLWithString:self.statusFrame.status.retweeted_status.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"icon"]];

    
}

-(void)setToolBarData
{
    self.CommentToolBar.frame=self.statusFrame.commentsToolF;
    self.CommentToolBar.wbstatus=self.statusFrame.status;

}



@end
