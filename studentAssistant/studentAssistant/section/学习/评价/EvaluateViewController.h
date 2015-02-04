//
//  EvaluateViewController.h
//  studentAssistant
//
//  Created by MyUpinup on 15/2/3.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface EvaluateViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView * evaluate_tableView;
@end
