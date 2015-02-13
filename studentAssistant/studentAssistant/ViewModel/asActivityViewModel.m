//
//  asActivityViewModel.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/26.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "asActivityViewModel.h"
#import "ASActiveDetailsViewController.h"
@implementation asActivityViewModel

#pragma mark --
#pragma mark -- 请求新闻数据
-(void)requestActivityViewModelData:(NSDictionary *)parameter{
    [ASAPIClient getActiveDynameicWithParameters:parameter result:^(BOOL finish, NSDictionary *results, NSError *error){
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
     NSMutableArray *activeModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    for (int i = 0; i < statuses.count; i ++) {
        asActiveModel * activModel = [[asActiveModel alloc] init];
        NSString * title_str = [statuses objectAtIndex:i][@"Title"];
        if (!ISNULLSTR(title_str)) {
            activModel.title_str = [statuses objectAtIndex:i][@"Title"];
        }else{
            activModel.title_str = @"未知标题";
        }
        
        activModel.time_str = [statuses objectAtIndex:i][@"CheckInTime"];
        if (activModel.time_str.length > 10) {
            activModel.time_str = [[statuses objectAtIndex:i][@"CheckInTime"] substringToIndex:10];
        }else{
            activModel.time_str = @"……";
        }
        
        NSString * abstract_str =[statuses objectAtIndex:i][@"Brief"];
        if (!ISNULLSTR(abstract_str)) {
            activModel.abstract_str = [statuses objectAtIndex:i][@"Brief"];
        }
//        activModel.abstract_str = @"是一个网络封包分析软件。网络封包分析软件的功能是撷取网络封包，并尽可能显示出最为详细的网络封包资料。Wireshark使用WinPCAP作为接口，直接与网.";
        NSString *PicUrl =[statuses objectAtIndex:i][@"PicUrl"];
        if (!ISNULLSTR(PicUrl)) {
            if ([PicUrl hasPrefix:@"http://"]) {
                activModel.imageUrl_str = PicUrl;
            }else{
                activModel.imageUrl_str =[NSString string_connctUrl:PicUrl];
            }
        }
        MyLog(@"++++++%@", activModel.imageUrl_str);
        activModel.imageUrl_str= [NSString string_connctUrl:[PicUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        activModel.activetyID =[statuses objectAtIndex:i][@"Id"];
        [activeModelArray addObject:activModel];
    }
    self.returnBlock(activeModelArray);
}
//跳转到详情页
-(void)ActivityDetailWithPublicModel: (asActiveModel *) activeModel WithViewController: (UIViewController *)superController{
    ASActiveDetailsViewController *detailController = [[ASActiveDetailsViewController alloc]init];
    detailController.title = @"新闻详情";
    detailController.hidesBottomBarWhenPushed = YES;
    detailController.activeNewID = activeModel.activetyID;
    [superController.navigationController pushViewController:detailController animated:YES];
}

@end
