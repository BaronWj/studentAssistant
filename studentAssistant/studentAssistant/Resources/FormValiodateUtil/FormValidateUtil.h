//
//  FormValidateUtil.h
//  volume
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

//

#import <Foundation/Foundation.h>
#import "defineSetting.h"
@interface FormValidateUtil : NSObject


+(BOOL) isAccountVerify:(NSString*) account;
+(BOOL) isPasswordVerify:(NSString*) password;
+(BOOL) isEmailVerify:(NSString *)email;
+(BOOL) isValidateMobile:(NSString *)mobile;
+(BOOL) isIdentificationCard:(NSString *)indentification;
+(BOOL) isNumber:(NSString *)number;//判断数字
@end
