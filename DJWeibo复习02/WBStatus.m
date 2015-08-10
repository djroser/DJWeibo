//
//  WBStatus.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/18.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBStatus.h"
#import "WBstatusUsr.h"
#import "NSDate+DJ.h"
@implementation WBStatus


-(NSString *)created_at
{
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    //Wed May 13 20:40:22 +0800 2015
    //EEE MMM dd HH:mm:ss Z yyyy
    fmt.dateFormat=@"EEE MMM dd HH:mm:ss Z yyyy";
    
    NSDate *createddate=[fmt dateFromString:_created_at];
    
    if (createddate.isToday) {
        if (createddate.deltaWithNow.hour>=1) {
            return [NSString stringWithFormat:@"%ld小时前",(long)createddate.deltaWithNow.hour];
        }else if (createddate.deltaWithNow.minute>=1)
        {
            return [NSString stringWithFormat:@"%ld分钟前",(long)createddate.deltaWithNow.minute];
        }else{
            return @"刚刚";
        }
        
    }else if (createddate.isYesterday){
        fmt.dateFormat=@"昨天 HH:mm";
        return [fmt stringFromDate:createddate];
    }else if (createddate.isThisYear){
        fmt.dateFormat=@"MMM dd HH:mm";
        return [fmt stringFromDate:createddate];
    }else{
        fmt.dateFormat=@"yyyy MMM dd HH:mm:ss";
        return [fmt stringFromDate:createddate];
    }
    
    
}

-(NSString *)source
{
//    NSLog(@"%@",_source);
    //<a href="http://app.weibo.com/t/feed/1tqBja" rel="nofollow">360安全浏览器</a>
    int loc=[_source rangeOfString:@">"].location + 1;
        if (loc>0) {
            int length=[_source rangeOfString:@"</"].location - loc;
//            NSLog(@"%d----%d",loc,length);

        NSString *newSource=[_source substringWithRange:NSMakeRange(loc, length)];
        
        return [NSString stringWithFormat:@"来自%@",newSource];
    }else{
        return _source;
    }
    
    
    
    
}



//+(instancetype)StatusWithDict:(NSDictionary *)dict
//{
//    return [[self alloc]initWithDict:dict];
//}
//
//-(instancetype)initWithDict:(NSDictionary *)dict
//{
//    if (self=[super init]) {
//        self.user=[WBstatusUsr UserWithStatusDict:dict[@"user"]];
//        self.created_at=dict[@"created_at"];
//        self.thumbnail_pic=dict[@"thumbnail_pic"];
//        self.source=dict[@"source"];
//        self.text=dict[@"text"];
//        self.comments_count=[dict[@"comments_count"]intValue];
//        self.reposts_count=[dict[@"reposts_count"]intValue];
//        
//    }
//    return self;
//}

@end
