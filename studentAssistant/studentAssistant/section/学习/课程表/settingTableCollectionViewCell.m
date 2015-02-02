//
//  settingTableCollectionViewCell.m
//  TeacherAssistant
//
//  Created by 潘伟杰 on 15/1/25.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "settingTableCollectionViewCell.h"

@implementation settingTableCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    }
-(void)setImage_array:(NSString *)image_name{
    self.image_name = image_name;
    self.imageView.image = [UIImage imageNamed:image_name];
    if (self.imageView.tag > 100) {
        self.imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        [self.imageView addGestureRecognizer:tapGesture];
        self.selectState = YES;
    }
}
-(void)selectCollectionView:(NSIndexPath *)indexPath{
    NSLog(@"%ld--%ld",indexPath.row,indexPath.section);
    self.imageView.image = [UIImage imageNamed:@"add"];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10 + indexPath.row * 80, 20, 80, 130)];
    imageView.image = [UIImage imageNamed:@"add"];
    [self.imageView  addSubview:imageView];
}

-(void)tapGesture:(UITapGestureRecognizer *)tap{
    NSLog(@"888888%@", [[self subviews] lastObject]);
    if (self.selectState == NO) {
        [self.imageView.layer setBorderWidth:2];
        [self.imageView.layer setBorderColor:[UIColor whiteColor].CGColor];
        self.selectState = NO;
        self.selectState = YES;
    }else{
        [self.imageView.layer setBorderWidth:2];
        [self.imageView.layer setBorderColor:[UIColor yellowColor].CGColor];
        self.selectState = NO;
    }
}
@end
