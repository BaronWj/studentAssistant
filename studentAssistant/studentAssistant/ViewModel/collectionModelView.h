//
//  collectionModelView.h
//  studentAssistant
//
//  Created by MyUpinup on 15/2/11.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//  收藏

//#import <Foundation/Foundation.h>
#import "ViewModelClass.h"
#import "asActiveModel.h"

@interface collectionModelView : ViewModelClass
-(void)requestCollectionViewModelData:(NSDictionary *)parameter;
//跳转到新闻详情页
-(void)CollectionNewsDetailWithPublicModel: (asActiveModel *) publicModel WithViewController: (UIViewController *)superController;
//跳转到新闻详情页
-(void)DeleteDetailWithPublicModel: (asActiveModel *) publicModel;

@end
