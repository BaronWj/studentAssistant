//
//  electiveTableViewCell.m
//  studentAssistant
//
//  Created by MyUpinup on 15/2/3.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "electiveTableViewCell.h"
#import "UITableViewCell+tableViewCell.h"
@implementation electiveTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [_chooseButton.layer setMasksToBounds:YES];
    [_chooseButton.layer setCornerRadius:3];
    [_chooseButton.layer setBorderWidth:1];
    [_chooseButton.layer setBorderColor:nav_backGround.CGColor];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
