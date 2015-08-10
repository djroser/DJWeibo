//
//  WBStatusFrame.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/19.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBStatusFrame.h"
#import "WBStatus.h"

@implementation WBStatusFrame


-(void)setStatus:(WBStatus *)status
{
    _status=status;
    
    CGFloat cellW=[UIScreen mainScreen].bounds.size.width;
    
    //topview
    CGFloat topX=0;
    CGFloat topY=0;
    CGFloat topW=cellW;
    CGFloat topH;
    
    //iconView
    
    CGFloat iconX=WBStatusCellBorder;
    CGFloat iconY=WBStatusCellBorder;
    CGFloat iconWH=35;
    _iconF=CGRectMake(iconX, iconY, iconWH,iconWH);
    
    //namelabel
    CGFloat nameX=CGRectGetMaxX(_iconF) + WBStatusCellBorder;
    CGFloat nameY=iconY;
    
    CGSize nameSize=[self.status.user.name sizeWithFont:WBStatusCellNameSize];
    
    _nameF=CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    
    //vip
    CGFloat vipX=CGRectGetMaxX(_nameF) + WBStatusCellBorder;
    CGFloat vipY=iconY;
    CGFloat vipWH=15;
    _vipF=CGRectMake(vipX, vipY, vipWH, vipWH);
    
    
    //timeView
    CGFloat timeX=nameX;
    CGFloat timeY=CGRectGetMaxY(_nameF) + WBStatusCellBorder * 0.5 ;
    CGSize timeSize=[self.status.created_at sizeWithFont:WBStatusCellcreate_atSize];
    _created_atF =CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    
    //sourceView
    CGFloat sourceX=CGRectGetMaxX(_created_atF) + WBStatusCellBorder;
    CGFloat sourceY=timeY;
    CGSize sourceSize=[self.status.source sizeWithFont:WBStatusCellcreate_atSize];
    _sourceF=CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    
    
    //text
    CGFloat textX=iconX;
    CGFloat textY=CGRectGetMaxY(_iconF) + WBStatusCellBorder ;
    
    CGFloat textMaxW= cellW - WBStatusCellBorder * 2;
    CGSize textSize=[self.status.text sizeWithFont:WBStatusCellTextSize constrainedToSize:CGSizeMake(textMaxW, MAXFLOAT)];
    _textF=CGRectMake(textX, textY, textSize.width, textSize.height);
    
    //textView
    CGFloat txViewX=iconX;
    CGFloat txViewY=CGRectGetMaxY(_textF) + WBStatusCellBorder;
    CGFloat txViewHW=100;
    
    if (self.status.thumbnail_pic) {
        _thumbnail_picF =CGRectMake(txViewX, txViewY, txViewHW, txViewHW);
        
        
    }
    
    topH=MAX(CGRectGetMaxY(_thumbnail_picF), CGRectGetMaxY(_textF)) +WBStatusCellBorder;
    
    
    /** 被转发微博 */
    if (self.status.retweeted_status) {
        
        CGFloat retViewX=iconX;
        CGFloat retViewY=CGRectGetMaxY(_textF) + WBStatusCellBorder * 0.5;
        CGFloat retViewW=topW;
        
        //被转发用户名
        CGFloat retnameX=retViewX;
        CGFloat retnameY=retViewY + WBStatusCellBorder;
         NSString *nameLabelText=[[NSString alloc]initWithFormat:@"@%@",self.status.retweeted_status.user.name ];
        CGSize retnameSize=[nameLabelText sizeWithFont:WBStatusCellretweetSize];
        
        _retweetnameF=CGRectMake(retnameX, retnameY, retnameSize.width, retnameSize.height);
        
                
        // 转发文字
//        CGFloat retTextX=CGRectGetMaxX(_retweetnameF) + WBStatusCellBorder;
        CGFloat retTextX=retnameX;
        CGFloat retTextY=retnameY;
        
         CGSize retTextSize=[self.status.retweeted_status.text sizeWithFont:WBStatusCellretweetSize constrainedToSize:CGSizeMake(textMaxW, MAXFLOAT)];
        
        CGFloat retnameLength=_retweetnameF.origin.x + _retweetnameF.size.width;
        
       
        
        
        _retweetLabelF=CGRectMake(retTextX, retTextY, retTextSize.width, retTextSize.height);
        
        
        //转发图片
        if (self.status.retweeted_status.thumbnail_pic) {
            
            CGFloat retpicX=retnameX;
            CGFloat retpicY=CGRectGetMaxY(_retweetLabelF) + WBStatusCellBorder;
            CGFloat retpicHW=100;
            _retweetpicF=CGRectMake(retpicX, retpicY, retpicHW, retpicHW);
            
            
        }
        
        
        topH=MAX(CGRectGetMaxY(_retweetLabelF), CGRectGetMaxY(_retweetpicF)) + WBStatusCellBorder;
        
        
        
    }
    
    //topView
    
    _topF=CGRectMake(topX, topY, topW, topH);
    
    
    
    //toolBar
    CGFloat toolX=0;
    CGFloat toolY=CGRectGetMaxY(_topF);
    CGFloat toolW=topW;
    CGFloat toolH=36;
    
    
    _commentsToolF=CGRectMake(toolX, toolY, toolW, toolH);
    
    
    
    _cellHeight=CGRectGetMaxY(_commentsToolF) + WBStatusCellBorder;
    
    
    
    
    
    
    
    
}




@end
