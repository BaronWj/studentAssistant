//
//  newFriendTableViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/22.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "newFriendTableViewCell.h"
#import "UITableViewCell+tableViewCell.h"
#import "UIImageView+UIImageCategory.h"
@implementation newFriendTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self tableViewCellBackbround];
    [_headImage setImageRoundedcorners:22];
    [self.passStateButton.layer setMasksToBounds:YES];
    [self.passStateButton.layer setCornerRadius:5];
    [self.passStateButton.layer setBorderWidth:1];
    [self.passStateButton.layer setBorderColor:backGround.CGColor];
    self.nameLabel.textColor = labelTextColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
