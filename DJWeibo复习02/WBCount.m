//
//  WBCount.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/17.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBCount.h"

@implementation WBCount


+(instancetype)CountWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {

        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

//从文件中解析对象时调用
-(id)initWithCoder:(NSCoder *)decoder
{
    if (self=[super init]) {
        self.access_token=[decoder decodeObjectForKey:@"access_token"];
        self.expiresTime=[decoder decodeObjectForKey:@"expiresTime"];
        self.expires_in=[decoder decodeInt64ForKey:@"expires_in"];
        self.remind_in=[decoder decodeInt64ForKey:@"remind_in"];
        self.uid=[decoder decodeInt64ForKey:@"uid"];
    }
    return self;
}

//存储对象时调用
-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.access_token forKey:@"access_token"];
    [encoder encodeObject:self.expiresTime forKey:@"expiresTime"];
    [encoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [encoder encodeInt64:self.remind_in forKey:@"remind_in"];
    [encoder encodeInt64:self.uid forKey:@"uid"];
}


@end
