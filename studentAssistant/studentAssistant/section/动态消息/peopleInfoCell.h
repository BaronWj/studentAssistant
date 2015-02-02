//
//  peopleInfoCell.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "peopleinfoModel.h"
@interface peopleInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleValue;
@property (strong, nonatomic) peopleinfoModel * peopleModel;
@end
