//
//  WBDiscoverViewController.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/7.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "WBDiscoverViewController.h"
#import "UIImage+DJweibo.h"
#import "DJSearchBar.h"
@implementation WBDiscoverViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.titleView=[DJSearchBar searchBar];
    
    
//    //背景
//    UITextField *searchBar=[[UITextField alloc]init];
//    searchBar.background=[UIImage imageResizeWithName:@"searchbar_textfield_background"];
//    
//    searchBar.frame=CGRectMake(0, 0, 300, 30);
//    //左边的图标
//    UIImageView *lefticon=[[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
//    lefticon.frame=CGRectMake(0, 0, 30, searchBar.frame.size.height);
//    lefticon.contentMode=UIViewContentModeCenter;
//    searchBar.leftView=lefticon;
//    searchBar.leftViewMode=UITextFieldViewModeAlways;
//    
//    //字体
//    searchBar.font=[UIFont systemFontOfSize:12];
//    
//    //提示语
//    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName]=[UIColor grayColor];
//    searchBar.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"搜索" attributes:attrs];
//    
//    
//    self.navigationItem.titleView=searchBar;
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *Vc=[[UIViewController alloc]init];
    Vc.view.backgroundColor=[UIColor redColor];
//    Vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:Vc animated:YES];
    NSLog(@"%@",self.navigationController);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"WB";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    cell.textLabel.text=@"哈哈";
    return cell;
}


@end
