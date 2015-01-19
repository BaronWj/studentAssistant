//
//  ASAPIClient.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "ASAPIClient.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "OpenUDID.h"
static NSString * const KDAPIBaseURLString = @"http://3g.kdnet.net/phone_v21/";
static const NSInteger kDefaultCacheMaxCacheAge = 60 * 60 * 24 * 3;
static const unsigned long long kDefaultCacheMaxCacheSize = 20 * 1024 * 1024;

@implementation ASAPIClient
+ (id)sharedClient {
    static dispatch_once_t onceToken;
    static ASAPIClient *_sharedClient;
    dispatch_once(&onceToken, ^{
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:KDAPIBaseURLString]];
        _sharedClient.maxCacheSize = kDefaultCacheMaxCacheSize;
        _sharedClient.maxCacheAge = kDefaultCacheMaxCacheAge;
        //        _sharedClient.requestSerializer.stringEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    });
    
    return _sharedClient;
}

+ (BOOL)networkReachable {
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) {
        NSLog(@"Error: Could not recover network reachability flags");
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    
    return (isReachable && !needsConnection) ? YES : NO;
}

#pragma mark - add params

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(NSDictionary *)parameters
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:parameters];
//    [params setObject:@"iphone" forKey:@"device"];
//    [params setObject:[OpenUDID value] forKey:@"deviceid"];
    return [super GET:URLString parameters:params success:success failure:failure];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(NSDictionary *)parameters
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:parameters];
//    [params setObject:@"iphone" forKey:@"device"];
//    [params setObject:[OpenUDID value] forKey:@"deviceid"];
    return [super POST:URLString parameters:params success:success failure:failure];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(NSDictionary *)parameters
       constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:parameters];
//    [params setObject:@"iphone" forKey:@"device"];
//    [params setObject:[OpenUDID value] forKey:@"deviceid"];
    return [super POST:URLString parameters:params constructingBodyWithBlock:block success:success failure:failure];
}

@end
