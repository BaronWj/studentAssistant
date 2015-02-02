//
//  ASAPIClient.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "configUrl.h"
@interface ASAPIClient : AFHTTPRequestOperationManager

// Dependancies


@property (assign, nonatomic) NSInteger maxCacheAge;
@property (assign, nonatomic) unsigned long long maxCacheSize;

+ (id)sharedClient;

+ (BOOL)networkReachable;

#pragma 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl;
//新闻
+ (AFHTTPRequestOperation *)getActiveDynameicWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block;
//活动标签
+ (AFHTTPRequestOperation *)getActiveLabelWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block;
//个人详情
+ (AFHTTPRequestOperation *)getPeopleInfoParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block;
//登录
+ (AFHTTPRequestOperation *)getLoginWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block;
//+ (NSString*)cacheName:(NSString*)name withID:(NSUInteger)itemID;
+ (void)cacheResults:(id)results forName:(NSString*)name;
//+ (BOOL)removeCache:(NSString *)name;
//
//+ (void)setNeedRefresh:(NSString *)name;
//+ (BOOL)needRefresh:(NSString*)name;
//+ (BOOL)needRefresh:(NSString*)name timeInterval:(NSInteger)interval;
//+ (BOOL)recentBoardNeedRefresh;
//+ (void)updateLastRefresh:(NSString *)name;
//
//+ (id)loadFromCache:(NSString*)name;
//- (unsigned long long)cacheSize;
//- (void)clearDisk;
//- (void)cleanDisk;
//- (void)backgroundCleanDisk;


@end
