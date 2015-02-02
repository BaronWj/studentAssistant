//
//  UITextField+common.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "UITextField+common.h"

@implementation UITextField (common)
-(void)setChangeTextFiledPlaceholder:(NSString *)PlaceHolder_Str{
    self.textAlignment = NSTextAlignmentLeft;
//    self.background = [UIImage imageNamed:@"textFiled.png"];
    self.backgroundColor = [UIColor clearColor];
    self.placeholder = PlaceHolder_Str;
    self.textColor = [UIColor blackColor];

    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
}

@end
