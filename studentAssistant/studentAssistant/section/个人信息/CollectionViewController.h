//
//  CollectionViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//  收藏

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UITableView+tableViewExtraCellHidden.h"
 
@interface CollectionViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) UITableView *  collection_tableView;
@property(nonatomic, strong) NSMutableArray * collection_array ;
@end
