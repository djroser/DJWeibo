//
//  WBAccountTool.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/17.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBAccountTool.h"
#import "WBCount.h"
@implementation WBAccountTool


+(void)saveAccount:(WBCount *)account
{
    //存储数据模型
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    
    NSString *file=[doc stringByAppendingPathComponent:@"account.data"];
    
    [NSKeyedArchiver archiveRootObject:account toFile:file];
}

+(WBCount *)Account
{
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    
    NSString *file=[doc stringByAppendingPathComponent:@"account.data"];
    
//    WBCount *account=[NSKeyedUnarchiver unarchiveObjectWithFile:file];
//    NSDate *now=[NSDate date];
    
    //判断测试帐号是否过期
//    if ([account.expiresTime compare:now]==kCFCompareLessThan) {
//        
//        return account;
//        
//    }else{
//        return nil;
//    }
    return [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    
}
@end
