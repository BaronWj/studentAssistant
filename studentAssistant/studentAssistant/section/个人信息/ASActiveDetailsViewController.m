//
//  ASActiveDetailsViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "ASActiveDetailsViewController.h"
#import "NSString+URLEncoding.h"
#import "UIKit+AFNetworking.h"
@interface ASActiveDetailsViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation ASActiveDetailsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton * _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
    _rightButton.frame = CGRectMake(0, 0, 24, 24);
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = buttonItem;
    [_rightButton addTarget:self action:@selector(pressCollection:) forControlEvents:UIControlEventTouchUpInside];
    
    _webView=[[UIWebView alloc] initWithFrame:CGRectZero];
    _webView.translatesAutoresizingMaskIntoConstraints=NO;
    _webView.delegate = self;
    [self.view addSubview:_webView];
    self.webView.opaque = NO;
    NSArray *h=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[webView]-0-|" options:0 metrics:nil views:@{@"webView":_webView}];
    NSArray *v=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[webView]-0-|" options:0 metrics:nil views:@{@"webView":_webView}];
    
    [self.view addConstraints:h];
    [self.view addConstraints:v];
    
    _webView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _webView.scrollView.backgroundColor = backGround;
//    _webView.
    MyLog(@"urlurl__%@",_activeNewID);
    NSString * str =[NSString stringWithFormat:@"%@/%@",[NSString string_connctUrl:GetNewInfo],_activeNewID];

    NSURLRequest * reqCase = [NSURLRequest requestWithURL:[NSURL URLWithString:str] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    [_webView loadRequest:reqCase];
    
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeBlack];
    
}

-(void)pressCollection:(id)sender{
//    192.168.1.10:8281/api/News/CollectionNews?userId=4d03484e-4c3f-e411-9227-13fa5dc9122a&newsId=1e1e3e9d-b3a2-e411-96c2-d850e6dd285f
    NSDictionary * dict = @{
                            @"userId":@"4d03484e-4c3f-e411-9227-13fa5dc9122a",
                            @"newsId":@"1e1e3e9d-b3a2-e411-96c2-d850e6dd285f",
                            };
    [ASAPIClient getCollectionWithParameters:dict result:^(BOOL finish, NSDictionary * dict , NSError * error){
        
        NSLog(@"____________%d",finish);
        NSLog(@"____________%@",dict);
        NSLog(@"____________%@",error);
        
    }];
}

#pragma mark --
#pragma mark -- webViewdelegate
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    MyLog(@"%@",error);
    [SVProgressHUD dismiss];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    MyLog(@"webViewDidFinishLoad%@",webView);
    [SVProgressHUD dismiss];

}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    MyLog(@"webViewDidStartLoad%@",webView);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
