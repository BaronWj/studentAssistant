//
//  opinionViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "opinionViewController.h"

@interface opinionViewController ()<UITextFieldDelegate,UITextViewDelegate>

@end

@implementation opinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.titleTextFiled = [[UITextField alloc]init];
//    [self.titleTextFiled setChangeTextFiledPlaceholder:@"标题"];
    self.titleTextFiled.delegate = self;
    self.titleTextFiled.tintColor = [UIColor whiteColor];
    self.titleTextFiled.placeholder = @"标题";
    self.titleTextFiled.textColor = labelTextColor;
    self.titleTextFiled.backgroundColor = UIColorFromRGB(0xd7d7d7);
    self.titleTextFiled.frame = CGRectMake(0,20,ScreenWidth,45);
    [self.view addSubview:self.titleTextFiled];
    
    self.commentTextView = [[UITextView alloc]init];
    self.commentTextView.backgroundColor = UIColorFromRGB(0xd7d7d7);
    self.commentTextView.textColor = [UIColor grayColor];
    self.commentTextView.tintColor = [UIColor whiteColor];
    self.commentTextView.font = [UIFont systemFontOfSize:16];
    self.commentTextView.text = @"内容";
    self.commentTextView.delegate = self;
    self.commentTextView.frame = CGRectMake(0,65 +10 , ScreenHeight, ScreenHeight - 40 -20 - 60 );
    [self.view addSubview:self.commentTextView];
}
#pragma mark --
#pragma mark -- UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    self.commentTextView.text = @"";
    self.commentTextView.textColor = labelTextColor;
}
-(void)textViewDidChange:(UITextView *)textView{
//    if (textView.text.length == 0) {
//        self.commentTextView.text = @"内容";
//
//    }
//
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
