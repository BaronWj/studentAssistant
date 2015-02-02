//
//  PeopleInfoViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "BaseViewController.h"

@interface PeopleInfoViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * people_tableView;
@property (nonatomic, strong) NSMutableArray * people_array;
@end
