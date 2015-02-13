//
//  SubstituteTableViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/28.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "SubstituteTableViewCell.h"
#import "defineSetting.h"
@implementation SubstituteTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    [self tableViewCellBackbround];
    self.backgroundColor = UIColorFromRGB(0xe7e7e6);
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:15];
    [self.layer setBorderWidth:6];
    [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    UIView * view = [[UIView alloc]initWithFrame:self.frame];
    view.backgroundColor = UIColorFromRGB(0xe7e7e6);
    self.selectedBackgroundView = view;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
