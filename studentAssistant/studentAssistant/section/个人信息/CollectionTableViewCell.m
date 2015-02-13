//
//  CollectionTableViewCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CollectionTableViewCell.h"

@implementation CollectionTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self  tableViewCellBackbround];
    
}
-(void)setActiveModel:(asActiveModel *)activeModel{
    self.titleLabel.text = activeModel.title_str;
    self.abstractLabel.text = activeModel.abstract_str;
    self.timeLabel.text = activeModel.time_str;
    [self.thumbnailmage setImageWithURL:[NSURL URLWithString:activeModel.imageUrl_str] placeholderImage:[UIImage imageNamed:@"newDefault"]];
    
}


- (void)willTransitionToState:(UITableViewCellStateMask)state
{
    [super willTransitionToState:state];
    if ((state & UITableViewCellStateShowingDeleteConfirmationMask) == UITableViewCellStateShowingDeleteConfirmationMask)
    {
        for (UIView *subview in self.subviews)
        {
            if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationButton"])
            {
                UIImageView *deleteBtn = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 64, 33)];
                [deleteBtn setImage:[UIImage imageNamed:@"equitAccount"]];
                [[subview.subviews objectAtIndex:0] addSubview:deleteBtn];
            }
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
