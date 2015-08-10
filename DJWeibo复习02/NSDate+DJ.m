//
//  NSDate+DJ.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/5/13.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "NSDate+DJ.h"

@implementation NSDate (DJ)



-(BOOL)isToday
{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    int unit=NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    //获得当前时间的年月日
    NSDateComponents *nowCmps=[calendar components:unit fromDate:[NSDate date]];
    
    //获得self时间的年月日
    NSDateComponents *selfCmps=[calendar components:unit fromDate:[NSDate self]];
    
    return (nowCmps.year==selfCmps.year&&
            nowCmps.month==selfCmps.month&&
            nowCmps.day==selfCmps.day);
    
    
    
}

-(BOOL)isYesterday
{
    return NO;
}


-(BOOL)isThisYear
{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    NSDateComponents *nowCmps=[calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSDateComponents *selfCmps=[calendar components:NSCalendarUnitYear fromDate:[NSDate self]];
    
    return (nowCmps.year==selfCmps.year);
    
    
}

-(NSDateComponents *)deltaWithNow
{

    NSCalendar *calendar=[NSCalendar currentCalendar];
    int unit=NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate: self toDate:[NSDate date] options:0];
    
    
}



@end
