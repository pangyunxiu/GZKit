//
//  GZLabel.h
//  GZKit
//
//  Created by xinshijie on 17/3/22.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger , GZLabelStyle){
    GZLabelStyleNone = 0,
    GZLabelStyleUser = 1,
    GZLabelStyleTopic = 2,
    GZLabelStyleLink = 3,
    GZLabelStyleAgreement = 4,
    GZLabelStyleUserDefine = 5,
    GZLabelStylePhoneNumber = 6
};

@class GZLabel ;

@protocol GZLabelDelegate <NSObject>

@optional

// 代理
-(void)GZLabel:(GZLabel *)label didSelectedString:(NSString *)selectedString forGZLabelStyle:(GZLabelStyle *)style onRange:(NSRange)range ;

@end

//Block
typedef void(^TapGZLabel)(UILabel *,GZLabelStyle, NSString * , NSRange);

@interface GZLabel : UILabel

/* 普通文字颜色 */
@property(nonatomic , strong)UIColor *GZLabelNormalColor ;

/* 选中时高亮背景色 */
@property(nonatomic , strong)UIColor *GZLabelHightLightBackgroundColor ;

/* 字符串+显示颜色 字典数组, */
@property(nonatomic, strong)NSArray<NSDictionary *> *GZLabelMatchArr;

/* 高亮文字设置颜色*/
-(void)setHightLightLabelColor:(UIColor *)hightLightColor forGZLabelStyle:(GZLabelStyle)GZLabelStyle;

/* delegate */
@property(nonatomic, weak)id<GZLabelDelegate> delegate;


/* 点击事件block */
@property(nonatomic, strong)TapGZLabel GZTapOperation;


@end
