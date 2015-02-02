//
//  StuSaveMessPlist.h
//  TeacherAssistant
//
//  Created by 迈艾普 on 14-4-28.
//  Copyright (c) 2014年 Baron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"
@interface StuSaveMessPlist : NSObject

//存信息
-(void)saveDictionary: (NSDictionary *)dict andWithPlistName :(NSString * )plistName;
//取信息
-(NSMutableArray *)getPlistArray: (NSString *)plistName;
//存信息
-(void)saveArray: (NSMutableArray *)_array andWithPlistName :(NSString * )plistName;
//缓存
-(NSMutableArray * )saveCacheArray: (NSMutableArray *)_array andWithPlistName :(NSString * )plistName;
//NSFileManage 缓存
-(NSMutableArray * )saveCacheArrayFileManage:(NSMutableArray *)_array andWithPlistName:(NSString *)plistName;
//NSfileManage 缓存读取
-(NSMutableArray * )getCacheArrayFileManage :(NSString *)plistName;


@end
