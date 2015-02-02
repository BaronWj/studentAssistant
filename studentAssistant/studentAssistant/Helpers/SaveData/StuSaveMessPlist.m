//
//  StuSaveMessPlist.m
//  TeacherAssistant
//
//  Created by 迈艾普 on 14-4-28.
//  Copyright (c) 2014年 Baron. All rights reserved.
//

#import "StuSaveMessPlist.h"

@implementation StuSaveMessPlist
-(void)saveDictionary: (NSDictionary *)dict andWithPlistName :(NSString * )plistName{
//    NSLog(@"1111%@",dict);
    //要往沙盒中写数据当然要先取的沙盒目录啦
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPaht=[paths objectAtIndex:0];
//  NSString * plist_name = [NSString stringWithFormat:@"historyRecord"];
    //取得完整的文件名
    NSString *fileName=[plistPaht stringByAppendingPathComponent:plistName];
//    NSLog(@"fileName is%@",fileName);
    //创建并写入文件
    NSMutableArray * writeData = [[NSMutableArray alloc]initWithContentsOfFile:fileName];
    if(!writeData)
    {
        writeData = [[NSMutableArray alloc]init];
    }
    [writeData addObject:dict];
    [writeData writeToFile:fileName atomically:YES];
    //检查是否写入
//    NSLog(@"write data is :%@",writeData);
    
}

-(NSMutableArray *)getPlistArray: (NSString *)plistName {
    //要往沙盒中写数据当然要先取的沙盒目录啦
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPaht=[paths objectAtIndex:0];
    //取得完整的文件名
    NSString * plist_name = plistName;
    NSString *fileName=[plistPaht stringByAppendingPathComponent:plist_name];
//    NSLog(@"fileName is%@",fileName);
    NSMutableArray * plistArray = [[NSMutableArray alloc]initWithContentsOfFile:fileName];
//    NSLog(@"read data is:%@", plistArray);
    
    
//    NSMutableDictionary * plist_dict = [[NSMutableDictionary alloc]initWithContentsOfFile:fileName];
//    NSEnumerator *enumerator = [HistorySort_array reverseObjectEnumerator];
//    NSString *item = nil;
//    while((item = [enumerator nextObject]))
//    {
//        [History_array addObject:item];
//    }
//    NSLog(@"read plist_dict is:%@", plist_dict);
    return  plistArray;

}

-(void)saveArray: (NSMutableArray *)_array andWithPlistName :(NSString * )plistName{
    
    //要往沙盒中写数据当然要先取的沙盒目录啦
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPaht=[paths objectAtIndex:0];
    //取得完整的文件名
    NSString *fileName=[plistPaht stringByAppendingPathComponent:plistName];
//    NSLog(@"fileName is%@",fileName);
    //创建并写入文件
    NSMutableArray * writeData = [[NSMutableArray alloc]initWithContentsOfFile:plistName];
    if(!writeData)
    {
        writeData = [[NSMutableArray alloc]init];
    }
    //    [writeData addObject:dict];
    [writeData setArray:_array];
    [writeData writeToFile:fileName atomically:YES];
    //检查是否写入
    
    //    [writeData addObject:dict];
//    NSLog(@"again write data is :%d",[writeData count]);
//      NSLog(@"1111again write data is :%@",writeData );
    
    
}


#pragma mark --
#pragma mark -- saveCase
-(NSMutableArray * )saveCacheArray: (NSMutableArray *)_array andWithPlistName :(NSString * )plistName{
    
    //要往沙盒中写数据当然要先取的沙盒目录啦
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPaht=[paths objectAtIndex:0];
    //取得完整的文件名
    NSString *fileName=[plistPaht stringByAppendingPathComponent:plistName];
//    NSLog(@"fileName is%@",fileName);
    //创建并写入文件
    NSMutableArray * writeData = [[NSMutableArray alloc]initWithContentsOfFile:plistName];
    if(!writeData)
    {
        writeData = [[NSMutableArray alloc]init];
    }
    //    [writeData addObject:dict];
    [writeData setArray:_array];
    
//    NSLog(@"+++++++%@",_array);
//    [writeData addObjectsFromArray:_array];
    [writeData writeToFile:fileName atomically:YES];
    //检查是否写入
    
    //    [writeData addObject:dict];
//    NSLog(@"saveCacheArray write data is :%@",writeData );
    
    return writeData;
}


#pragma mark --
#pragma mark -- fileManage Case
-(NSMutableArray * )saveCacheArrayFileManage:(NSMutableArray *)_array andWithPlistName:(NSString *)plistName{
    //创建文件管理器
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString *documents = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString * dataPath = [documents stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json",plistName]];
    NSString * arrayJson = [_array JSONString];
    
    if ([fileManager fileExistsAtPath:dataPath]) {
//        NSLog(@"有此文件1");
        //删除文件
        [fileManager removeItemAtPath:dataPath error:nil];
        //创建
        [fileManager createFileAtPath:dataPath contents:[arrayJson dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }else {
//        NSLog(@"无此文件");
        //创建
        [fileManager createFileAtPath:dataPath contents:[arrayJson dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    }

    NSData *jdata = [[NSData alloc] initWithContentsOfFile:dataPath];
    NSMutableArray *resultArray = [jdata objectFromJSONData];
//    NSLog(@"_________%@",resultArray);
    return resultArray;
}


#pragma mark --
#pragma mark -- fileManage Case
-(NSMutableArray * )getCacheArrayFileManage :(NSString *)plistName{
    //创建文件管理器
    NSString *documents = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString * dataPath = [documents stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json",plistName]];
    
    //本地读取
    NSData *jdata = [[NSData alloc] initWithContentsOfFile:dataPath];
    NSMutableArray *resultArray = [jdata objectFromJSONData];
//    NSLog(@"_________%@",resultArray);
    
    return resultArray;
}




@end
