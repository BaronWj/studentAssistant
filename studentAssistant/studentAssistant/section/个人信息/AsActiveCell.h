//
//  AsActiveCell.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/7.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "asActiveModel.h"

@interface AsActiveCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *abstractLabel;//摘要
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//标题
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;//时间

@property (strong, nonatomic) asActiveModel * activeModel;
@end
