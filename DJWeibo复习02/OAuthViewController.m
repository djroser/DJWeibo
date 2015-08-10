//
//  OAuthViewController.m
//  DJWeibo复习02
//
//  Created by 丁健 on 15/4/16.
//  Copyright (c) 2015年 丁健. All rights reserved.
//

#import "OAuthViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "WBCount.h"
#import "MBProgressHUD+MJ.h"
#import "WBAccountTool.h"
#import "WBChooseRootVcTool.h"
@interface OAuthViewController()<UIWebViewDelegate>


@end
@implementation OAuthViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIWebView *webView=[[UIWebView alloc]init];
    webView.frame=self.view.bounds;
    webView.delegate=self;
    [self.view addSubview:webView];
    
    NSURL *url=[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=3571526813&redirect_uri=http://www.baidu.com"];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"客官请稍等～"];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    
   
    NSString *urlStr=request.URL.absoluteString;
    
    //查找“code＝”在urlStr中的范围
    NSRange range=[urlStr rangeOfString:@"code="];
    
    if (range.length) {
        NSUInteger loc=range.location + range.length;
        
        NSString *code=[urlStr substringFromIndex:loc];
        
        //发送请求给新浪，通过code换取accesstoken
        [self acessTokenWithcode:code];
        
        
    }
    return YES;
}

-(void)acessTokenWithcode:(NSString *)code
{
    //AFN（AFNetwork框架）
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    
    //说明服务器返回的json数据
    mgr.responseSerializer=[AFJSONResponseSerializer serializer];
    
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    /*
     
     client_id	true	string	申请应用时分配的AppKey。
     client_secret	true	string	申请应用时分配的AppSecret。
     grant_type	true	string	请求的类型，填写authorization_code
     
     App Key：3571526813
     App Secret：a0e2f8cd1f6b8c8a7e6b900d4657898d
     http://www.baidu.com
     
     code	true	string	调用authorize获得的code值。
     redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
     **/
    
    
    params[@"client_id"]=@"3571526813";
    params[@"client_secret"]=@"a0e2f8cd1f6b8c8a7e6b900d4657898d";
    params[@"grant_type"]=@"authorization_code";
    params[@"code"]=code;
    params[@"redirect_uri"]=@"http://www.baidu.com";
    
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
     
        //字典转模型
        WBCount *account=[WBCount CountWithDict:responseObject];
        
        //存储数据模型
        [WBAccountTool saveAccount:account];
        
        //选择根控制器
        
        [WBChooseRootVcTool Choose:nil];
        
        
        [MBProgressHUD hideHUD];
        
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
        [MBProgressHUD hideHUD];
     }];
}




@end
