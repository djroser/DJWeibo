//
//  WBHomeViewController.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBHomeViewController.h"
#import "UIImage+DJweibo.h"
#import "UIBarButtonItem+DJBarItem.h"
#import "WBTitleButton.h"
#import "AFNetworking.h"
#import "WBAccountTool.h"
#import "WBCount.h"
#import "UIImageView+WebCache.h"
#import "WBstatusUsr.h"
#import "WBStatus.h"
#import "WBStatusCell.h"
#import "WBStatusFrame.h"
#import "MJExtension.h"

#define WBTitleButtonUpTag -1
#define WBTitleButtonDownTag 0

@interface WBHomeViewController()

@property(nonatomic,strong)NSArray *statusFrame;


@end
@implementation WBHomeViewController

//-(NSArray *)DJStatuses
//{
//    if (_DJStatuses==nil) {
//        _DJStatuses=[NSMutableArray array];
//    }
//    return _DJStatuses;
//}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
        
    //https://api.weibo.com/2/statuses/home_timeline.json
    //设置导航栏
    [self setupNavBar];
  
    //获取微博数据
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    
    mgr.responseSerializer=[ AFJSONResponseSerializer serializer];
    
    NSMutableDictionary *paras=[NSMutableDictionary dictionary];
    
    paras[@"access_token"]=[WBAccountTool Account].access_token;
    
    
    
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:paras success:^(AFHTTPRequestOperation *operation, id responseObject) {
        

//        NSLog(@"%@",responseObject[@"statuses"]);
        
        
        NSArray *statusArray=[WBStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        
        NSMutableArray *statusFrameArray=[NSMutableArray array];
        
        for (WBStatus *status in statusArray) {
            
            WBStatusFrame *statusFrame=[[WBStatusFrame alloc]init];
            
            statusFrame.status=status;
            
            [statusFrameArray addObject:statusFrame];
            
        }
        self.statusFrame=statusFrameArray;
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"failed");
    }];
    

}

-(void)setupNavBar
{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem ItemWithIcon:@"navigationbar_friendsearch" highlightedIcon:@"navigationbar_friendsearch_highlighted" target:self action:@selector(AddFfriends)];
    
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem ItemWithIcon:@"navigationbar_pop" highlightedIcon:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    WBTitleButton *titleButton=[[WBTitleButton alloc]init];
    [titleButton setTitle:@"半yue山岚" forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    titleButton.tag=WBTitleButtonDownTag;
    titleButton.frame=CGRectMake(0, 0, 150, 30);
    
    [titleButton addTarget:self action:@selector(ClickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=titleButton;
    
    self.tableView.backgroundColor=[UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0];

    //修改tabBar数据（测试Btn）
//    UIButton *btn=[UIButton buttonWithType:UIButtonTypeContactAdd];
//    btn.frame=CGRectMake(50, 50, 55, 55);
//    [btn addTarget:self action:@selector(changeBadgeValue) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrame.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBStatusCell *cell=[WBStatusCell cellWithTableView:tableView];
    
    
    cell.statusFrame=self.statusFrame[indexPath.row];
    
//    NSURL *imageUrl=[NSURL URLWithString:status.user.profile_image_url];
//    
//    
//    
////    NSData *imageData=[NSData dataWithContentsOfURL:imageUrl];
////    
////    cell.imageView.image=[UIImage imageWithData:imageData];
//    
//    [cell.imageView setImageWithURL:imageUrl placeholderImage:[UIImage imageWithName:@"icon"]];
//    cell.textLabel.text=status.text;
//    
//    cell.detailTextLabel.text=status.user.name;
    
    return cell;
}

-(void)ClickTitleBtn:(WBTitleButton *)titleButton
{
    
    if (titleButton.tag== WBTitleButtonUpTag) {
        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        titleButton.tag=WBTitleButtonDownTag;
    }else
    {
        [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        titleButton.tag= WBTitleButtonUpTag;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBStatusCell *cell=[WBStatusCell cellWithTableView:tableView];
    
    cell.statusFrame=self.statusFrame[indexPath.row];
    
    return cell.statusFrame.cellHeight;
}

-(void)AddFfriends
{
    NSLog(@"AddFfriends");
}

-(void)pop
{
    NSLog(@"pop");
}

-(void)changeBadgeValue
{
    self.tabBarItem.badgeValue=@"22";
    self.tabBarItem.title=@"变化";
}

@end
