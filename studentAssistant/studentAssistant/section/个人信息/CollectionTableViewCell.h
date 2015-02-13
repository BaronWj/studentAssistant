//
//  CollectionTableViewCell.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "defineSetting.h"
#import "asActiveModel.h"
@interface CollectionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailmage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *abstractLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@property (strong, nonatomic) asActiveModel * activeModel;

@end
