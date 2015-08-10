//
//  WBStatusCell.h
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/19.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBStatusFrame;
@interface WBStatusCell : UITableViewCell


@property(nonatomic,strong)WBStatusFrame *statusFrame;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
