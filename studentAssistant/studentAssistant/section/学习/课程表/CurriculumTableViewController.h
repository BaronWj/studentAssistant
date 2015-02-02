//
//  CurriculumTableViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/14.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DropDownChooseProtocol.h"

@interface CurriculumTableViewController : BaseViewController<DropDownChooseDelegate,DropDownChooseDataSource>

@end
