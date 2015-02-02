//
//  ModifyPwdViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#define textFiledHight 45
#import "ModifyPwdViewController.h"
@interface ModifyPwdViewController ()

@end


@implementation ModifyPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.oldPassWordTextFiled = [[UITextField alloc]init];
//    [_oldPassWordTextFiled setChangeTextFiledPlaceholder:@"旧密码"];
    _oldPassWordTextFiled.placeholder = @"旧密码";
    self.oldPassWordTextFiled.backgroundColor = UIColorFromRGB(0xd7d7d7);
    self.oldPassWordTextFiled.textAlignment = NSTextAlignmentCenter;
    self.oldPassWordTextFiled.delegate = self;
    self.oldPassWordTextFiled.frame = CGRectMake(0,20,ScreenWidth,textFiledHight);
    [self.view addSubview:self.oldPassWordTextFiled];

    self.nowPassWordTextFiled = [[UITextField alloc]init];
//    [self.nowPassWordTextFiled setChangeTextFiledPlaceholder:@"新密码"];
    _nowPassWordTextFiled.placeholder = @"新密码";
    self.nowPassWordTextFiled.backgroundColor = UIColorFromRGB(0xd7d7d7);
    self.nowPassWordTextFiled.textAlignment = NSTextAlignmentCenter;
    self.nowPassWordTextFiled.delegate = self;
    self.nowPassWordTextFiled.frame = CGRectMake(0,20 + textFiledHight +5,ScreenWidth,textFiledHight);
    [self.view addSubview:self.nowPassWordTextFiled];
    
    self.againPassWordTextFiled = [[UITextField alloc]init];
    _againPassWordTextFiled.placeholder = @"确认信密码";
    self.againPassWordTextFiled.backgroundColor = UIColorFromRGB(0xd7d7d7);
//    [self.againPassWordTextFiled setChangeTextFiledPlaceholder:@"确认信密码"];
    self.againPassWordTextFiled.textAlignment = NSTextAlignmentCenter;
    self.againPassWordTextFiled.delegate = self;
    self.againPassWordTextFiled.frame = CGRectMake(0,20 + textFiledHight * 2 + 10 ,ScreenWidth,textFiledHight);
    [self.view addSubview:self.againPassWordTextFiled];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(20, textFiledHight *3 +60,ScreenWidth -40 , 40)];
    [button setBackgroundColor:UIColorFromRGB(0x92e1bb)];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:4];
    [button setTitle:@"确定修改" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    

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
