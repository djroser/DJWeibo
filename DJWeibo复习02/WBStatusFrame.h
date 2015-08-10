//
//  WBStatusFrame.h
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/19.
//  Copyright (c) 2015年 丁健. All rights reserved.
//
#define WBStatusCellBorder 10
/* 微博namesize字体**/
#define WBStatusCellNameSize [UIFont systemFontOfSize:15]

/* 微博create_at字体**/
#define WBStatusCellcreate_atSize [UIFont systemFontOfSize:12]

/* 微博text字体**/
#define WBStatusCellTextSize [UIFont systemFontOfSize:16]

/* 转发微博text字体**/
#define WBStatusCellretweetSize [UIFont systemFontOfSize:16]
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WBStatus;

@interface WBStatusFrame : NSObject


@property(nonatomic,strong)WBStatus *status;

/** topView */
@property(nonatomic,assign, readonly) CGRect topF;

/** 用户头像 */
@property(nonatomic,assign, readonly) CGRect iconF;

/** 用户名 */
@property(nonatomic,assign, readonly) CGRect nameF;

/** 用户会员 */
@property(nonatomic,assign, readonly) CGRect vipF;

/** 发送时间 */
@property(nonatomic,assign, readonly) CGRect created_atF;

/** 来源 */
@property(nonatomic,assign, readonly) CGRect sourceF;

/** 正文 */
@property(nonatomic,assign, readonly) CGRect textF;

/** 原创配图 */
@property(nonatomic,assign, readonly) CGRect thumbnail_picF;



/** 被转发微博 */
@property(nonatomic,assign, readonly) CGRect retweetedViewF;

/** 转发用户姓名 */
@property(nonatomic,assign, readonly) CGRect retweetnameF;

/** 转发图片 */
@property(nonatomic,assign, readonly) CGRect retweetpicF;

/** 转发文字 */
@property(nonatomic,assign, readonly) CGRect retweetLabelF;




/** 评论转发工具条 */
@property(nonatomic,assign, readonly) CGRect commentsToolF;

/** 行高*/
@property(nonatomic,assign, readonly) CGFloat cellHeight;






@end
