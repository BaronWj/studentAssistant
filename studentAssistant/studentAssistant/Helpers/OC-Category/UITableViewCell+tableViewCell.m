//
//  UITableViewCell+tableViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "UITableViewCell+tableViewCell.h"

@implementation UITableViewCell (tableViewCell)
- (void)tableViewCellBackbround
{
    self.backgroundColor = [UIColor whiteColor];
    self.textLabel.textColor = labelTextColor;
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    UIView * view = [[UIView alloc]initWithFrame:self.frame];
    view.backgroundColor = UIColorFromRGB(0xf9f9f9);
    self.selectedBackgroundView = view;
}


@end
