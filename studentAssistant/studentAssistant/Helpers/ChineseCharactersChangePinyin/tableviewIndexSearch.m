//
//  tableviewIndexSearch.m
//  StudentAssistant
//
//  Created by 迈艾普 on 13-11-2.
//  Copyright (c) 2013年 Baron. All rights reserved.
//

#import "tableviewIndexSearch.h"
#import "ChineseString.h"
#import "ChineseToPinyin.h"

@implementation tableviewIndexSearch

+(NSMutableArray*)getChineseStringArr:(NSMutableArray*)arrToSort withSectionHeadsKeys:(NSMutableArray*)sectionHeadsKeys
{

    NSMutableArray *chineseStringArray = [NSMutableArray array];
    for (int i = 0; i < arrToSort.count; i++) {
        ChineseString *chinesestring = [[ChineseString alloc]init];
        chinesestring.string = arrToSort[i];
        chinesestring.pinYin = [ChineseToPinyin pinyinFromChiniseString:arrToSort[i]];
        //NSLog(@"%@   %@",chinesestring.string,chinesestring.pinYin);
        [chineseStringArray addObject:chinesestring];
    }
    //sort the ChineseStringArray by pinYin
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
    [chineseStringArray sortUsingDescriptors:sortDescriptors];
    /* 测试  拼音已经排好序了
     for (int i = 0; i < chineseStringArray.count; i++) {
     ChineseString* str = [[ChineseString alloc]init];
     str = chineseStringArray[i];
     NSLog(@"**  %@",str.pinYin);
     }
     */
    
    NSMutableArray * arrayForArray = [[NSMutableArray alloc]initWithCapacity:0];
    BOOL checkValuesAtIndex=NO;
    NSMutableArray *TempArrForGrouping = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (int index = 0; index < chineseStringArray.count; index++) {
        ChineseString *chineseStr = (ChineseString*)[chineseStringArray objectAtIndex:index];
        NSMutableString *strchar = [NSMutableString stringWithString:chineseStr.pinYin];
        NSString *sr = [strchar substringToIndex:1];
        if (![sectionHeadsKeys containsObject:[sr uppercaseString]]) {
            [sectionHeadsKeys addObject:[sr uppercaseString]];
            TempArrForGrouping = [[NSMutableArray alloc]initWithObjects: nil];
            checkValuesAtIndex = NO;
        }
        if ([sectionHeadsKeys containsObject:[sr uppercaseString]]) {
            [TempArrForGrouping addObject:[chineseStringArray objectAtIndex:index]];
            if (checkValuesAtIndex == NO) {
                [arrayForArray addObject:TempArrForGrouping];
                checkValuesAtIndex = YES;
            }
        }
        
    }
    
    return arrayForArray;
}
@end
