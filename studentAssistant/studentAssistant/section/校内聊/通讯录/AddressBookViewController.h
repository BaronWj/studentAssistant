//
//  AddressBookViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/12.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "AddressTableViewCell.h"
#import "UIBadgeView.h"

@interface AddressBookViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    UIBadgeView *badgeView;

}
@property (nonatomic,strong)UITableView * address_tableView;

@end
