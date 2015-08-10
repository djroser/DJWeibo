//
//  NSDate+DJ.h
//  DJWeibo复习02
//
//  Created by 丁健 on 15/5/13.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DJ)

-(BOOL)isToday;
-(BOOL)isYesterday;
-(BOOL)isThisYear;
-(NSDateComponents *)deltaWithNow;
@end
