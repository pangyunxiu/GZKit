//
//  ViewController.m
//  GZKit
//
//  Created by xinshijie on 17/3/22.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "ViewController.h"
#import "GZWebViewController.h"
#import "GZLabel.h"

@interface ViewController ()<GZLabelDelegate>

@property (strong, nonatomic)GZLabel *gztextLabel;

@end
@implementation ViewController
- (void)viewDidLoad {
      __weak __typeof__(self) weakSelf = self ;
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    _gztextLabel = [[GZLabel alloc]initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width - 100, 200)];
    [self.view addSubview:_gztextLabel];
    
    self.gztextLabel.text = @"#GZLabel# 用于各种字符串的内容显示, 用户:@轻斟浅醉17, 包括话题:#怎么成为行业大神?#, 链接:http://www.jianshu.com/u/ab83189244d9, 使用说明:《使用说明》, 还有自定义要高亮显示的字符串,电话:13468651651.";
    
    // 非匹配内容文字颜色
    self.gztextLabel.GZLabelNormalColor = [UIColor colorWithRed:112.0/255 green:93.0/255 blue:77.0/255 alpha:1];
    
    // 点选高亮文字颜色
    self.gztextLabel.GZLabelHightLightBackgroundColor = [UIColor colorWithRed:237.0/255 green:213.0/255 blue:177.0/255 alpha:1];
    
    // 匹配文字颜色
    [self.gztextLabel setHightLightLabelColor:[UIColor colorWithRed:132.0/255 green:77.0/255 blue:255.0/255 alpha:1] forGZLabelStyle:GZLabelStyleUser];
    [self.gztextLabel setHightLightLabelColor:[UIColor colorWithRed:1.0/255 green:16.0/255 blue:213.0/255 alpha:1] forGZLabelStyle:GZLabelStyleLink];
    [self.gztextLabel setHightLightLabelColor:[UIColor colorWithRed:254.0/255 green:156.0/255 blue:59.0/255 alpha:1] forGZLabelStyle:GZLabelStyleTopic];
    [self.gztextLabel setHightLightLabelColor:[UIColor colorWithRed:255.0/255 green:69.0/255 blue:0.0/255 alpha:1] forGZLabelStyle:GZLabelStyleAgreement];
    
     [self.gztextLabel setHightLightLabelColor:[UIColor colorWithRed:9.0/255 green:160.0/255 blue:213.0/255 alpha:1] forGZLabelStyle:GZLabelStylePhoneNumber];
    
    // 自定义匹配的文字和颜色#8FDF5C
    self.gztextLabel.GZLabelMatchArr = @[
                                   @{
                                       @"string" : @"高亮显示",
                                       @"color" : [UIColor colorWithRed:0.55 green:0.86 blue:0.74 alpha:1]
                                       }
                                   ];
    
    // 匹配到合适内容的回调
    self.gztextLabel.GZTapOperation = ^(UILabel *label, GZLabelStyle style, NSString *selectedString, NSRange range){
        
        // 你想要做的事
        NSLog(@"block打印 %@", selectedString);
        
        if (style == GZLabelStyleLink) {
            
            GZWebViewController *web = [GZWebViewController new];
            web.URL = selectedString;
            [weakSelf.navigationController pushViewController:web animated:YES];
        }
        if (style == GZLabelStylePhoneNumber) {
        UIAlertController *alertControler = [UIAlertController alertControllerWithTitle:@"拨号" message:selectedString preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
                return ;
            }];
            UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",selectedString]] options:@{ NSDocumentTypeDocumentAttribute: NSPlainTextDocumentType } completionHandler:^(BOOL success) {
                }];
            }];
            [alertControler addAction:noAction];
            [alertControler addAction:yesAction];
            [weakSelf presentViewController:alertControler animated:YES completion:nil];

        }
    };

    
    self.gztextLabel.delegate = self;
    
}

#pragma mark --------------------------------------------------
#pragma mark GZLabelDelegate

-(void)GZLabel:(GZLabel *)label didSelectedString:(NSString *)selectedString forGZLabelStyle:(GZLabelStyle *)style onRange:(NSRange)range{
    
    // 你想要做的事
    NSLog(@"代理打印 %@", selectedString);
    
}
@end
