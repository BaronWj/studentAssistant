//
//  NSString+URLEncoding.m
//  DoubanBook
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "NSString+URLEncoding.h"
#import "AppDelegate.h"

@implementation NSString(URLEncoding)
- (NSString *)urlEncodeString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, 
                (CFStringRef)self, 
                NULL, 
                (CFStringRef)@";/?:@&=$+{}<>,",
                kCFStringEncodingUTF8));
    return result ;

}

+(NSString *)string_connctUrl:(NSString *)str{
    NSString * str_url = [iPhoneDelegate.requestUrl stringByAppendingString:str];
    return str_url;
}
@end
