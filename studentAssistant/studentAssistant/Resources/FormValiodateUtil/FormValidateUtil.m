//
//  FormValidateUtil.m
//  volume
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

//

#import "FormValidateUtil.h"

@implementation FormValidateUtil

+(BOOL) isAccountVerify:(NSString*) account{
    if(ISNULLSTR(account)) {
        return NO;
    }
    NSString * patternString = @"^([a-zA-Z0-9_.\u4e00-\u9fa5]{2,16})+$";
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", patternString];
    return ([regextest evaluateWithObject:account] == YES);
}


+(BOOL) isPasswordVerify:(NSString*) password{
    if(ISNULLSTR(password)) {
        return NO;
    }
    NSString * patternString = @"^([a-zA-Z0-9_-`~!@#$%^&*()+\\|\\\\=,./?><\\{\\}\\[\\]]{6,16})+$";
    NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", patternString];
    return ([regextest evaluateWithObject:password] == YES);
}

+(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
//     NSString *phoneRegex = @"^((17[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}
+(BOOL) isEmailVerify:(NSString *)email
{
    if (ISNULLSTR(email)) {
        return NO;
    }  
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return ([emailTest evaluateWithObject:email] == YES);

}
//验证身份整
+(BOOL) isIdentificationCard:(NSString *)indentification{
    if(ISNULLSTR(indentification)){
        return NO;
    }
    NSString *indentificationRegex = @"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}((19\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|(19\\d{2}(0[13578]|1[02])31)|(19\\d{2}02(0[1-9]|1\\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\\d{3}(\\d|X|x)?$";
    NSPredicate * indentificationText = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",indentificationRegex];
    
    return ( [indentificationText evaluateWithObject:indentification] == YES);
}
//判断数字
+(BOOL) isNumber:(NSString *)number{
    if(ISNULLSTR(number)){
        return NO;
    }
    NSString *numberRegex = @"^[0-9]*$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return ([numberTest evaluateWithObject:number] == YES);



}

@end
