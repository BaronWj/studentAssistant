//
//  asActivityViewModel.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/26.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "ViewModelClass.h"
#import "asActiveModel.h"
#import "defineSetting.h"

@interface asActivityViewModel : ViewModelClass
-(void)requestActivityViewModelData:(NSDictionary *)parameter;
//跳转到新闻详情页
-(void)ActivityDetailWithPublicModel: (asActiveModel *) publicModel WithViewController: (UIViewController *)superController;
@end
