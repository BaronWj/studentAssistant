//
//  focusNewModel.h
//  studentAssistant
//
//  Created by MyUpinup on 15/2/3.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModelClass.h"
#import "asActiveModel.h"
@interface focusNewModel : ViewModelClass
-(void)requestFocusNewsViewModelData:(NSDictionary *)parameter;
//跳转到新闻详情页
-(void)ActivityDetailWithPublicModel: (asActiveModel *) publicModel WithViewController: (UIViewController *)superController;
@end
