//
//  NSString+URLEncoding.h
//  DoubanBook
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(URLEncoding)
- (NSString *)urlEncodeString;
+(NSString *)string_connctUrl:(NSString *)str;

@end
