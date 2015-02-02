//
//  newChatTableViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/20.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "newChatTableViewCell.h"
#import "UIBadgeView.h"
#import "UIImageView+UIImageCategory.h"
@implementation newChatTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self tableViewCellBackbround];
    [self.headImage setImageRoundedcorners:21];
  
    _namelabel.textColor = labelTextColor;
    _messLabel.textColor = UIColorFromRGB(0x929191);
    
    UIBadgeView *  badgeView = [[UIBadgeView alloc] initWithFrame:CGRectMake(44, 0, 40, 30)];
    badgeView.badgeString = @"2";
    badgeView.badgeColor = UIColorFromRGB(0xf7bc08);
    [self addSubview:badgeView];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
