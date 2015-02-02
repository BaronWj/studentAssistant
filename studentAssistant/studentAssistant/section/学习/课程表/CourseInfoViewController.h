//
//  CourseInfoViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/22.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface CourseInfoViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{

}
@property (nonatomic, strong)UITableView * courseTableView;
@end
