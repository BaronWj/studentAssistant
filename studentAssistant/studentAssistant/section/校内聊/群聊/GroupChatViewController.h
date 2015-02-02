//
//  GroupChatViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/20.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface GroupChatViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * groupChat_tableView;
@end
