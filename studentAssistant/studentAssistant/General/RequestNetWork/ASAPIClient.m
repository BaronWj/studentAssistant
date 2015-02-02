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
#import "AppDelegate.h"
#import "defineSetting.h"
static NSString * const KDAPIBaseURLString = @"http://192.168.1.200:8281/Api/";
static const NSInteger kDefaultCacheMaxCacheAge = 60 * 60 * 24 * 3;
static const unsigned long long kDefaultCacheMaxCacheSize = 20 * 1024 * 1024;

@implementation ASAPIClient
+ (id)sharedClient {
    static dispatch_once_t onceToken;
    static ASAPIClient *_sharedClient;
    dispatch_once(&onceToken, ^{
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:iPhoneDelegate.requestUrl]];
        _sharedClient.maxCacheSize = kDefaultCacheMaxCacheSize;
        _sharedClient.maxCacheAge = kDefaultCacheMaxCacheAge;
        _sharedClient.requestSerializer.stringEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
       
    });
    
    return _sharedClient;
}

//+ (BOOL)networkReachable {
//    // Create zero addy
//    struct sockaddr_in zeroAddress;
//    bzero(&zeroAddress, sizeof(zeroAddress));
//    zeroAddress.sin_len = sizeof(zeroAddress);
//    zeroAddress.sin_family = AF_INET;
//    
//    // Recover reachability flags
//    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
//    SCNetworkReachabilityFlags flags;
//    
//    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
//    CFRelease(defaultRouteReachability);
//    
//    if (!didRetrieveFlags) {
//        NSLog(@"Error: Could not recover network reachability flags");
//        return NO;
//    }
//    
//    BOOL isReachable = flags & kSCNetworkFlagsReachable;
//    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
//    
//    return (isReachable && !needsConnection) ? YES : NO;
//}
//
#pragma 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl
{
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return netState;
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

#pragma mark -
#pragma mark _asActiveDynameic
+ (AFHTTPRequestOperation *)getActiveDynameicWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block {
//    __weak id weakSelf = self;
    AFHTTPRequestOperation *operation =
    [[ASAPIClient sharedClient] GET:GetActivityDataUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         MyLog(@"ActiveDynameicWithParameters_________%@",responseObject);
//         NSString *userID = [responseObject objectForKey:@"userid"];
//         //  KCLogInt([userID integerValue]);
//         if ([userID integerValue] > 0)
//             [weakSelf cacheResults:responseObject forName:[NSString stringWithFormat:@"user-%@", userID]];
//         if (block) block([userID integerValue] > 0, responseObject, nil);
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if (block)block(YES,responseObject,nil);

     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) block(NO, nil, error);
         MyLog(@"error______%@",error);
     }];
    
    MyLog(@"===============%@",operation.request.URL);
    
    return operation;
}
//活动标签
+ (AFHTTPRequestOperation *)getActiveLabelWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block {
    //    __weak id weakSelf = self;
    AFHTTPRequestOperation *operation =
    [[ASAPIClient sharedClient] GET:GetActivityLabel parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         MyLog(@"ActiveDynameicWithParameters_________%@",responseObject);
         //         NSString *userID = [responseObject objectForKey:@"userid"];
         //         //  KCLogInt([userID integerValue]);
         //         if ([userID integerValue] > 0)
         //             [weakSelf cacheResults:responseObject forName:[NSString stringWithFormat:@"user-%@", userID]];
         //         if (block) block([userID integerValue] > 0, responseObject, nil);
         //        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
         if (block)block(YES,responseObject,nil);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) block(NO, nil, error);
         MyLog(@"error______%@",error);
     }];
    
    MyLog(@"%@",operation.request.URL);
    
    return operation;
}

+ (AFHTTPRequestOperation *)getPeopleInfoParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block {
//    __weak id weakSelf = self;
    AFHTTPRequestOperation *operation =
    [[ASAPIClient sharedClient] GET:GetPeopleInfo parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         MyLog(@"%@",responseObject);
//         NSString *userID = [responseObject objectForKey:@"userid"];
         //  KCLogInt([userID integerValue]);
//         if ([userID integerValue] > 0)
//             [weakSelf cacheResults:responseObject forName:[NSString stringWithFormat:@"user-%@", userID]];
//         if (block) block([userID integerValue] > 0, responseObject, nil);
         if (block)block(YES,responseObject,nil);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) block(NO, nil, error);
     }];
    
    MyLog(@"%@",operation.request.URL);
    
    return operation;
}






+ (AFHTTPRequestOperation *)getLoginWithParameters:(NSDictionary *)parameters result:(void (^)(BOOL success, NSDictionary *results, NSError *error))block {
//    __weak id weakSelf = self;
    AFHTTPRequestOperation *operation =
    [[ASAPIClient sharedClient] POST:GetLogin parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
//         MyLog(@"%@",responseObject);
//         NSString *userID = [responseObject objectForKey:@"userid"];
//         //  KCLogInt([userID integerValue]);
//         if ([userID integerValue] > 0)
//             [weakSelf cacheResults:responseObject forName:[NSString stringWithFormat:@"user-%@", userID]];
//         if (block) block([userID integerValue] > 0, responseObject, nil);
        if (block)block(YES,responseObject,nil);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (block) block(NO, nil, error);
     }];


    MyLog(@"operation.request.URL%@",operation.request.URL);
    return operation;
}



#pragma mark -
#pragma mark Cache

+ (BOOL)cacheExists:(NSString *)name {
    return [[NSFileManager defaultManager] fileExistsAtPath:[self pathForCache:name]];
}

+ (BOOL)removeCache:(NSString *)name {
    return [[NSFileManager defaultManager] removeItemAtPath:[self pathForCache:name] error:nil];
}

+ (void)cacheResults:(id)results forName:(NSString *)name {
    NSString *path = [self pathForCache:name];
    [NSKeyedArchiver archiveRootObject:results toFile:path];
}

+ (id)loadFromCache:(NSString *)name {
    NSString *path = [self pathForCache:name];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) return nil;
    id results = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return results;
}

- (unsigned long long)cacheSize {
    unsigned long long size = 0;
    NSString *cachePath = [ASAPIClient pathForCache:@""];
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:cachePath];
    for (NSString *fileName in fileEnumerator) {
        NSString *filePath = [cachePath stringByAppendingPathComponent:fileName];
        NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        size += [attrs fileSize];
    }
    return size;
}

- (void)clearDisk {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSFileManager defaultManager] removeItemAtPath:[ASAPIClient pathForCache:@""] error:nil];
        [[NSFileManager defaultManager] createDirectoryAtPath:[ASAPIClient pathForCache:@""] withIntermediateDirectories:YES attributes:nil error:NULL];
    });
}

- (void)cleanDisk {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSURL *diskCacheURL = [NSURL fileURLWithPath:[ASAPIClient pathForCache:@""] isDirectory:YES];
        NSArray *resourceKeys = @[ NSURLIsDirectoryKey, NSURLContentModificationDateKey, NSURLTotalFileAllocatedSizeKey ];
        
        NSDirectoryEnumerator *fileEnumerator = [fileManager enumeratorAtURL:diskCacheURL
                                                  includingPropertiesForKeys:resourceKeys
                                                                     options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                errorHandler:NULL];
        
        NSDate *expirationDate = [NSDate dateWithTimeIntervalSinceNow:-self.maxCacheAge];
        NSMutableDictionary *cacheFiles = [NSMutableDictionary dictionary];
        unsigned long long currentCacheSize = 0;
        
        for (NSURL *fileURL in fileEnumerator) {
            NSDictionary *resourceValues = [fileURL resourceValuesForKeys:resourceKeys error:NULL];
            
            // Skip directories.
            if ([resourceValues[NSURLIsDirectoryKey] boolValue]) {
                continue;
            }
            
            // Remove files that are older than the expiration date;
            NSDate *modificationDate = resourceValues[NSURLContentModificationDateKey];
            if ([[modificationDate laterDate:expirationDate] isEqualToDate:expirationDate]) {
                [fileManager removeItemAtURL:fileURL error:nil];
                continue;
            }
            
            // Store a reference to this file and account for its total size.
            NSNumber *totalAllocatedSize = resourceValues[NSURLTotalFileAllocatedSizeKey];
            currentCacheSize += [totalAllocatedSize unsignedLongLongValue];
            [cacheFiles setObject:resourceValues forKey:fileURL];
        }
        
        // If our remaining disk cache exceeds a configured maximum size, perform a second
        // size-based cleanup pass.  We delete the oldest files first.
        if (self.maxCacheSize > 0 && currentCacheSize > self.maxCacheSize) {
            // Target half of our maximum cache size for this cleanup pass.
            const unsigned long long desiredCacheSize = self.maxCacheSize / 2;
            
            // Sort the remaining cache files by their last modification time (oldest first).
            NSArray *sortedFiles = [cacheFiles keysSortedByValueWithOptions:NSSortConcurrent
                                                            usingComparator:^NSComparisonResult(id obj1, id obj2)
                                    {
                                        return [obj1[NSURLContentModificationDateKey] compare:obj2[NSURLContentModificationDateKey]];
                                    }];
            
            // Delete files until we fall below our desired cache size.
            for (NSURL *fileURL in sortedFiles)
            {
                if ([fileManager removeItemAtURL:fileURL error:nil]) {
                    NSDictionary *resourceValues = cacheFiles[fileURL];
                    NSNumber *totalAllocatedSize = resourceValues[NSURLTotalFileAllocatedSizeKey];
                    currentCacheSize -= [totalAllocatedSize unsignedLongLongValue];
                    
                    if (currentCacheSize < desiredCacheSize) {
                        break;
                    }
                }
            }
        }
    });
}

- (void)backgroundCleanDisk {
    UIApplication *application = [UIApplication sharedApplication];
    __block UIBackgroundTaskIdentifier bgTask = [application beginBackgroundTaskWithExpirationHandler:^
                                                 {
                                                     // Clean up any unfinished task business by marking where you
                                                     // stopped or ending the task outright.
                                                     [application endBackgroundTask:bgTask];
                                                     bgTask = UIBackgroundTaskInvalid;
                                                 }];
    
    // Start the long-running task and return immediately.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
                   {
                       // Do the work associated with the task, preferably in chunks.
                       [self cleanDisk];
                       
                       [application endBackgroundTask:bgTask];
                       bgTask = UIBackgroundTaskInvalid;
                   });
}

+ (NSString *)pathForCache:(NSString *)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingString:@"/KDCache/"];
    if(![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:NULL]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return [path stringByAppendingString:name];
}


@end
