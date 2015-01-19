//
//  ASAPIClient.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface ASAPIClient : AFHTTPRequestOperationManager

// Dependancies


@property (assign, nonatomic) NSInteger maxCacheAge;
@property (assign, nonatomic) unsigned long long maxCacheSize;

+ (id)sharedClient;

+ (BOOL)networkReachable;
//
//+ (AFHTTPRequestOperation *)loginWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)checkUsernameWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSString *message))block;
//+ (AFHTTPRequestOperation *)registerWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results))block;
//+ (AFHTTPRequestOperation *)loadRecentBoardsWithParameters:(NSDictionary *)parameters result:(void (^)(NSDictionary *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadHomeDataWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadEvenlfDataWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadPostDataWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//
//+ (AFHTTPRequestOperation *)loadCommunityDataWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//
//+ (AFHTTPRequestOperation *)loadplDataWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadmacDataWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//
////+ (AFHTTPRequestOperation *)loadCommuntilyDataWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//
//+ (AFHTTPRequestOperation *)loadloveDataWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//
//
////+ (AFHTTPRequestOperation *)loadHotsWithParameters:(NSDictionary *)parameters fromCache:(BOOL)fromCache result:(void (^)(NSArray *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadHotsWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadBoardsWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadPostsWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadPostWithParameters:(NSDictionary *)parameters result:(void (^)(NSDictionary *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadReplyWithParameters:(NSDictionary *)parameters result:(void (^)(NSDictionary *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadExpListWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)handleFavoriteWithParameters:(NSDictionary *)parameters result:(void (^)(NSDictionary *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)handlePraiseWithParameters:(NSDictionary *)parameters result:(void (^)(NSDictionary *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadMyPostWithParameters:(NSDictionary *)parameters result:(void (^)(NSDictionary *results, NSError *error))block;
//
//+ (AFHTTPRequestOperation *)loadPushListWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//
//+ (AFHTTPRequestOperation *)loadFollowWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//
//+ (AFHTTPRequestOperation *)searchWithParameters:(NSDictionary *)parameters result:(void (^)(NSDictionary *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadHotKeywordsWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//
//+ (AFHTTPRequestOperation *)postWithParameters:(NSDictionary *)parameters result:(void (^)(NSDictionary *results, NSError *error))block;
//
//+ (AFHTTPRequestOperation *)uploadWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSError *error))block;
//
////+ (AFHTTPRequestOperation *)loadMessageWithParameters:(NSDictionary *)parameters result:(void (^)(NSDictionary *results, NSError *error))block;
//+ (AFHTTPRequestOperation *)loadMessageDetailWithParameters:(NSDictionary *)parameters result:(void (^)(NSArray *results, NSError *error))block;
//
//
//#pragma mark 新增
//+ (AFHTTPRequestOperation *)joinWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block;
//
//
//+ (NSString*)cacheName:(NSString*)name withID:(NSUInteger)itemID;
//+ (void)cacheResults:(id)results forName:(NSString*)name;
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
