//
//  WBCount.h
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/17.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WBCount : NSObject<NSCoding>

@property(nonatomic,copy)NSString *access_token;

@property(nonatomic,assign)NSDate *expiresTime;

@property(nonatomic,assign)long long int expires_in;

@property(nonatomic,assign)long long int remind_in;

@property(nonatomic,assign)long long int uid;

+(instancetype)CountWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
