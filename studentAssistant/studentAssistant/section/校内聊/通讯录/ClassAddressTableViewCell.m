//
//  ClassAddressTableViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/22.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "ClassAddressTableViewCell.h"
#import "UITableViewCell+tableViewCell.h"
#import "UIImageView+UIImageCategory.h"
@implementation ClassAddressTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self tableViewCellBackbround];
    [self.headImage setImageRoundedcorners:21];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
