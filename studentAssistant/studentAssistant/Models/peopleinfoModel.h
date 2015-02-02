//
//  peopleinfoModel.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface peopleinfoModel : NSObject
@property (nonatomic, strong) NSString * name_str;//个人信息姓名
@property (nonatomic, strong) NSString * post_str;//教师职称
@property (nonatomic, strong) NSString * jobNumber_str;//工号
@property (nonatomic, strong) NSString * email_str;//邮箱
@property (nonatomic, strong) NSString * phoneNum_str;//电话
@property (nonatomic, strong) NSString * sex_str;//性别
@property (nonatomic, strong) NSString * identityCard_str;//身份证号
@property (nonatomic, strong) NSString * resume_str;//简历
@property (nonatomic, strong) NSString * peopleID;//身份ID
@property (nonatomic, strong) NSString * headImage_url;//头像地址
@end
