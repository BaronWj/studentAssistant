//
//  EucationModel.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/7.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EucationModel : NSObject
/*
 *  标题
 */
@property (nonatomic, copy) NSString * title;
/**
 *  描述
 */
@property (nonatomic, copy) NSString * desc;
/**
   *  当前组所有行的数据
*/
@property (nonatomic, strong) NSArray * educationInfo_array;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
