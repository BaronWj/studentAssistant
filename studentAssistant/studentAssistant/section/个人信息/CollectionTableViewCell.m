//
//  CollectionTableViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CollectionTableViewCell.h"
#import "UITableViewCell+tableViewCell.h"
@implementation CollectionTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self  tableViewCellBackbround];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
