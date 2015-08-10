//
//  WBAccountTool.h
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/17.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WBCount;
@interface WBAccountTool : NSObject

+(void)saveAccount:(WBCount *)account;

+(WBCount *)Account;
@end
