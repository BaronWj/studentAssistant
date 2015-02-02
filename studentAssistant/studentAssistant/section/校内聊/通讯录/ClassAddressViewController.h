//
//  ClassAddressViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/22.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface ClassAddressViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * address_tableView;

@end
