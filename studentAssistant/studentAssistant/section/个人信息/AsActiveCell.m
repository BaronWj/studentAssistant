//
//  AsActiveCell.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/7.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "AsActiveCell.h"
#import "defineSetting.h"


@implementation AsActiveCell

- (void)awakeFromNib {
    // Initialization code
    [self tableViewCellBackbround];
}

-(void)setActiveModel:(asActiveModel *)activeModel{
    self.abstractLabel.text = activeModel.abstract_str;
    self.timeLabel.text = activeModel.time_str;
    self.titleLabel.text = activeModel.title_str;
//    self.ImageView.image = [UIImage imageNamed:activeModel.imageUrl_str];
//    [self.ImageView setImageWithURL:[NSURL URLWithString:activeModel.imageUrl_str] placeholderImage:[UIImage imageNamed:@"2"] options:SDWebImageRefreshCached];
    [self.ImageView setImageWithURL:[NSURL URLWithString:activeModel.imageUrl_str] placeholderImage:[UIImage imageNamed:@"newDefault"]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
