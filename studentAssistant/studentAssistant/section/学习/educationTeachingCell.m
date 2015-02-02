//
//  educationTeachingCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/7.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "educationTeachingCell.h"
#import "UITableViewCell+tableViewCell.h"
@implementation educationTeachingCell

- (void)awakeFromNib {
    // Initialization code
    [self tableViewCellBackbround];
    _teacherImage.image = [UIImage imageNamed:@"callName"];
    _titleLabel.text = @"考勤";
    _titleLabel.textColor = labelTextColor;
    _projectInfoLabel.text = @"目前课程:";
    _projectInfoLabel.textColor = UIColorFromRGB(0x929191);
}

-(void)setEducation_dict:(NSDictionary *)education_dict{
    _education_dict = education_dict;
    if (_education_dict) {
//        MyLog(@"___222___%@",[NSString stringWithFormat:@"%@",[education_dict valueForKey:@"name"]]);
        _titleLabel.text = [education_dict valueForKey:@"name"];
        _projectInfoLabel.text = [education_dict valueForKey:@"msg"];
        _teacherImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[education_dict valueForKey:@"headImage_url"]]];
    }

}
-(void)setEducation:(EucationModel *)education{
    _education = education;
    MyLog(@"%@",_education);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
   
    // Configure the view for the selected state
}


@end
