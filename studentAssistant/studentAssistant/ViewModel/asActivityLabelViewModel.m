//
//  asActivityLabel.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/27.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "asActivityLabelViewModel.h"

@implementation asActivityLabelViewModel
#pragma mark --
#pragma mark -- 请求新闻数据
-(void)requestActivityViewModelData{
    NSDictionary *parameter = @{
                                };
    
    [ASAPIClient getActiveLabelWithParameters:parameter result:^(BOOL sucess, NSDictionary *results, NSError *error){
        if(sucess == YES){
            [self fetchValueSuccessWith:results];
        }
        
    }];
}

#pragma mark --
#pragma mark --获取数据，处理数据
-(void)fetchValueSuccessWith: (NSDictionary *)dictValue{
    NSArray *statuses = dictValue[@"Data"];
    NSMutableArray *activeModelLabelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    for (int i = 0; i < statuses.count; i ++) {
        asActiVityLabelModel * activModelLabel = [[asActiVityLabelModel alloc] init];
        activModelLabel.className = [statuses objectAtIndex:i][@"Name"];
        activModelLabel.Id = [statuses objectAtIndex:i][@"Id"];
        [activeModelLabelArray addObject:activModelLabel];
    }
    self.returnBlock(activeModelLabelArray);
}

#pragma 对ErrorCode进行处理
-(void) errorCodeWithDic: (NSDictionary *) errorDic
{
    self.errorBlock(errorDic);
}

#pragma 对网路异常进行处理
-(void) netFailure
{
    self.failureBlock();
}



@end
