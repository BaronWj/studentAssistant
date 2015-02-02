//
//  asActiveModel.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/26.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//  新闻字段属性

#import <Foundation/Foundation.h>

@interface asActiveModel : NSObject
@property (strong, nonatomic) NSString * title_str;//标题
@property (strong, nonatomic) NSString * abstract_str;//摘要
@property (strong, nonatomic) NSString * time_str;//时间
@property (strong, nonatomic) NSString * imageUrl_str;//图片地址
@property (strong, nonatomic) NSString * activetyID;//活动ID
@end
