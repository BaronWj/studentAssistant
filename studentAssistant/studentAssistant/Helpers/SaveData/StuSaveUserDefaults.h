//
//  StuSaveUserDefaults.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/30.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StuSaveUserDefaults : NSObject
+(void)saveAccountAndPassWord:(NSDictionary *)dict;
//保存用户密码
+(NSDictionary *)getAccountAndPassWord;
+(void)saveFirstLogin:(BOOL)firstLoginState;
+(BOOL)getFirstLogin;

+(void)saveUserID:(NSString *)string;
+(NSString *)getUserId;
@end
