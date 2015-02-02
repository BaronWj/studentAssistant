//
//  TimeCell.m
//  表格
//
//  Created by zzy on 14-5-7.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import "TimeCell.h"
#import "MyLabel.h"
#import "defineSetting.h"
@implementation TimeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 40)];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        self.timeLabel.textColor = labelTextColor;
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
