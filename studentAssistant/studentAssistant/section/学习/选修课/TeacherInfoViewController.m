//
//  TeacherInfoViewController.m
//  studentAssistant
//
//  Created by MyUpinup on 15/2/12.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "TeacherInfoViewController.h"

@interface TeacherInfoViewController ()

@end

@implementation TeacherInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImageView * headImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 65, 65)];
    headImage.image = [UIImage imageNamed:@"student5"];
    [headImage setImageRoundedcorners:65/2];
    [self.view addSubview:headImage];
    
    UILabel * labelName = [[UILabel alloc]initWithFrame:CGRectMake(90, 8, 200, 30)];
    labelName.text = @"王晓红";
    labelName.textColor = labelTextColor;
    labelName.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:labelName];
    
    UILabel * chineaseName = [[UILabel alloc]initWithFrame:CGRectMake(90, 24, 200, 30)];
    chineaseName.text = @"wangxiaohong";
    chineaseName.textColor = labelTextColor;
    chineaseName.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:chineaseName];
    
    
    UILabel * jobName = [[UILabel alloc]initWithFrame:CGRectMake(90, 45, 200, 30)];
    jobName.text = @"教师";
    jobName.textColor = labelTextColor;
    jobName.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:jobName];
    
    
    UIImageView * lineImage =[[UIImageView alloc]initWithFrame:CGRectMake(10, 90, ScreenWidth-10, 1)];
    lineImage.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineImage];
    
    UILabel * workName = [[UILabel alloc]initWithFrame:CGRectMake(10, 95, 200, 30)];
    workName.text = @"职位";
    workName.textColor = labelTextColor;
    workName.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:workName];
    
    UILabel * workNameValue = [[UILabel alloc]initWithFrame:CGRectMake(80, 95, ScreenWidth - 90, 30)];
    workNameValue.text = @"校长、主任、班主任";
    workNameValue.textAlignment = NSTextAlignmentRight;
    workNameValue.textColor = labelTextColor;
    workNameValue.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:workNameValue];
    
    
    UIImageView * lineImage1 =[[UIImageView alloc]initWithFrame:CGRectMake(10, 130, ScreenWidth-10, 1)];
    lineImage1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineImage1];
    
    UIImageView * lineImage2 =[[UIImageView alloc]initWithFrame:CGRectMake(10, 175, ScreenWidth-10, 1)];
    lineImage2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineImage2];

    UIImageView * lineImage3 =[[UIImageView alloc]initWithFrame:CGRectMake(10, 220, ScreenWidth-10, 1)];
    lineImage3.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineImage3];

    
    UILabel * sexName = [[UILabel alloc]initWithFrame:CGRectMake(10, 140, 80, 30)];
    sexName.text = @"性别";
    sexName.textColor = labelTextColor;
    sexName.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:sexName];
    
    UILabel * sexNameValue = [[UILabel alloc]initWithFrame:CGRectMake(80, 140, ScreenWidth - 90, 30)];
    sexNameValue.text = @"男";
    sexNameValue.textAlignment = NSTextAlignmentRight;
    sexNameValue.textColor = labelTextColor;
    sexNameValue.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:sexNameValue];
    
    UILabel * professInfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 185, 80, 30)];
    professInfoLabel.text = @"专业";
    professInfoLabel.textColor = labelTextColor;
    professInfoLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:professInfoLabel];
    
    UILabel * professInfoLabelValue = [[UILabel alloc]initWithFrame:CGRectMake(80, 185, ScreenWidth - 90, 30)];
    professInfoLabelValue.text = @"多媒体艺术";
    professInfoLabelValue.textAlignment = NSTextAlignmentRight;
    professInfoLabelValue.textColor = labelTextColor;
    professInfoLabelValue.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:professInfoLabelValue];
    
    
    UILabel * briefLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 230, 80, 30)];
    briefLabel.text = @"简历:";
    briefLabel.textColor = labelTextColor;
    briefLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:briefLabel];
    
    UITextView * edit_textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 255,ScreenWidth -10 , ScreenHeight - 260)];
    edit_textView.text = @"牛津大学荣休院士、中国艺术史权威迈克尔·苏立文，以他的深厚学养和数十年心血累积而成《中国艺术史》，其阐述既不西方本位，也不囿于中国传统，从不故作高深，也没有炫耀知识的虚荣。他提供给我们的不仅仅是知识本身，更是一种融会贯通的文化视野，将各种不同艺术形式置于大历史环境中交相观看并体会的胸怀，是对中国艺术演进脉络的整体梳理和把握。";
    edit_textView.editable = NO;
    edit_textView.textColor = labelTextColor;
    edit_textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:edit_textView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
