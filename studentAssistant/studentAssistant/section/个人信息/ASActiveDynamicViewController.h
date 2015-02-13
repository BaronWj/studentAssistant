//
//  ASActiveDynamicViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
//#import "EducationalTeachingViewController.h"
#import "newlabelView.h"
#import "asActivityViewModel.h"
#import "focusNewModel.h"
@interface ASActiveDynamicViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) newlabelView * lableView;
@property(nonatomic, strong) UITableView * asactive_tableView;
@property(nonatomic, strong) NSString * categoryID;
@end
