//
//  peopleInfoCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "peopleInfoCell.h"
#import "UITableViewCell+tableViewCell.h"
@implementation peopleInfoCell

- (void)awakeFromNib {
    // Initialization code
    [self tableViewCellBackbround];
}

-(void)setPeopleModel:(peopleinfoModel *)peopleModel{
//    self.titleValue = peopleModel;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
