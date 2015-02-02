//
//  peopleInfoViewModel.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "peopleInfoViewModel.h"
@implementation peopleInfoViewModel

-(void)requestPeopleInfoViewModelData:(NSDictionary *)parameter{
    [ASAPIClient getPeopleInfoParameters:parameter result:^(BOOL finish, NSDictionary *results, NSError *error){
        if(finish == YES){
            [self fetchValueSuccessWith:results];
        }else{
            self.failureBlock(finish);
        }
        
    }];

}


#pragma mark --
#pragma mark --获取数据，处理数据
-(void)fetchValueSuccessWith: (NSDictionary *)dictValue{
    NSArray *statuses = dictValue[@"Data"];
    NSMutableArray *peopleInfoArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    for (int i = 0; i < statuses.count; i ++) {
        peopleinfoModel * peopleModel = [[peopleinfoModel alloc] init];
//        peopleModel.name_str = [statuses objectAtIndex:i][@"Name"];
//        peopleModel.post_str = [statuses objectAtIndex:i][@"Id"];
//        peopleModel.phoneNum_str = [statuses objectAtIndex:i][@"Id"];
//        peopleModel.peopleID = [statuses objectAtIndex:i][@"Id"];
//        peopleModel.email_str = [statuses objectAtIndex:i][@"Id"];
//        peopleModel.sex_str = [statuses objectAtIndex:i][@"Id"];
//        peopleModel.email_str = [statuses objectAtIndex:i][@"Id"];
//        peopleModel.identityCard_str = [statuses objectAtIndex:i][@"Id"];
//        peopleModel.jobNumber_str = [statuses objectAtIndex:i][@"Id"];
        
          peopleModel.name_str = @"王小明";
          peopleModel.post_str = @"1912030123012";
          peopleModel.phoneNum_str = @"1912030123012";
          peopleModel.peopleID = @"1912030123012";
          peopleModel.email_str = @"1912030123012";
          peopleModel.sex_str = @"男";
          peopleModel.email_str = @"1912030123012";
          peopleModel.identityCard_str = @"1912030123012";
          peopleModel.jobNumber_str = @"1912030123012";

        
         [peopleInfoArray addObject:peopleModel];
    }
    self.returnBlock(peopleInfoArray);
    
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


//跳转到详情页
-(void)ActivityDetailWithPublicModel: (peopleinfoModel *) publicModel WithViewController: (UIViewController *)superController{
    PeopleInfoViewController * peopleInfoController = [[PeopleInfoViewController alloc]init];
    peopleInfoController.hidesBottomBarWhenPushed = YES;
    peopleInfoController.title = @"我";
//    peopleInfoController.activeNewID = activeModel.activetyID;
    [superController.navigationController pushViewController:peopleInfoController animated:YES];
}
@end
