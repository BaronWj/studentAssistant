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
    self.backgroundColor = UIColorFromRGB(0x13494f);
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:15];
    [self.layer setBorderWidth:6];
    [self.layer setBorderColor:backGround.CGColor];
    UIView * view = [[UIView alloc]initWithFrame:self.frame];
    view.backgroundColor = UIColorFromRGB(0x13494f);
    self.selectedBackgroundView = view;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
