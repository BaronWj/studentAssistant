//
//  StuSaveUserDefaults.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/30.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "StuSaveUserDefaults.h"
#import "defineSetting.h"
#define  userDefaults [NSUserDefaults standardUserDefaults]
@implementation StuSaveUserDefaults
//存入用户名密码
+(void)saveAccountAndPassWord:(NSDictionary *)dict{
    [userDefaults setObject:dict forKey:USERANDPWED];
    [userDefaults synchronize];
}

//取出密码
+(NSDictionary *)getAccountAndPassWord{
     return [userDefaults objectForKey:USERANDPWED];
}

+(void)saveFirstLogin:(BOOL)firstLoginState;
{
    [userDefaults setBool:firstLoginState forKey:FIRSTLODINSTATE];
    [userDefaults synchronize];
}
+(BOOL)getFirstLogin{
    if ([userDefaults objectForKey:FIRSTLODINSTATE]) {
        return YES;
    }else{
        return NO;
    }
}



@end
