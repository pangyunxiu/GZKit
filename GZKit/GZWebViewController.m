//
//  GZWebViewController.m
//  GZKit
//
//  Created by xinshijie on 17/3/22.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZWebViewController.h"

@interface GZWebViewController ()

@end

@implementation GZWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *GZwebView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:GZwebView];
    
    NSURL *url = [NSURL URLWithString:_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [GZwebView loadRequest:request];
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
