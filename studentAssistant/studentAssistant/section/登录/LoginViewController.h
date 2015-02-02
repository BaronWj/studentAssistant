//
//  LoginViewController.h
//  StudentAssistant
//
//  Created by 迈艾普 on 14-2-26.
//  Copyright (c) 2014年 Baron. All rights reserved.
//
#import "BaseViewController.h"
#import "ChooseShcoolViewController.h"
#import "ForgetViewController.h"
@interface LoginViewController : BaseViewController<UITextFieldDelegate,UIApplicationDelegate,changeValue_school>
{
    NSInteger remindAccountState;//记住账户状态
    NSInteger remindPasswordState;//记住密码状态

}

@property (weak, nonatomic) IBOutlet UILabel *schoolLable;
@property (weak, nonatomic) IBOutlet UITextField *schoolTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *accountTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;


- (IBAction)forgetPassword:(id)sender;//忘记密码
- (IBAction)loginWay:(id)sender;
- (IBAction)chooseSchoolPangesture:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *forgetButton;


@end
