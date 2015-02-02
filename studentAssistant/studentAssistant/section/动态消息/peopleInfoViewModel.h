//
//  peopleInfoViewModel.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "ViewModelClass.h"
#import "peopleinfoModel.h"
#import "PeopleInfoViewController.h"
@interface peopleInfoViewModel :ViewModelClass

-(void)requestPeopleInfoViewModelData:(NSDictionary *)parameter;


-(void)ActivityDetailWithPublicModel: (peopleinfoModel *) publicModel WithViewController: (UIViewController *)superController;
@end
