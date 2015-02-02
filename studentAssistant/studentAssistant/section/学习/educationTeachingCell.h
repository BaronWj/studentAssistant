//
//  educationTeachingCell.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/7.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"EucationModel.h"
#import "defineSetting.h"
@interface educationTeachingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *teacherImage;//教学图标
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//标题
@property (weak, nonatomic) IBOutlet UILabel *projectInfoLabel;//详情
@property (strong, nonatomic) NSDictionary * education_dict;
@property (strong, nonatomic) EucationModel * education;

@end
