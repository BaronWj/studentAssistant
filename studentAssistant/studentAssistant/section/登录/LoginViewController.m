//
//  LoginViewController.m
//  StudentAssistant
//
//  Created by 迈艾普 on 14-2-26.
//  Copyright (c) 2014年 Baron. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString_Encryption.h"
#import "UITextField+common.h"
#import "NSString_Encryption.h"
//#import "BPush.h"
//#import "sys/utsname.h"
#define  remindAccountNormal 0
#define  remindAccountSelect 1
#define  remindPassWordNormal 0
#define  remindPassWordSelect 1

@interface LoginViewController (){
//    StuAppDelegate *appDelegate;
}

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createShadow:NO];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = UIColorFromRGB(0x84b73e);
    remindAccountState = remindAccountNormal;
    _schoolTextFiled.delegate = self;
    [_accountTextFiled setChangeTextFiledPlaceholder:@"请填写账号"];
    [_passwordTextFiled setChangeTextFiledPlaceholder:@"请填写密码"];
    _accountTextFiled.font = [UIFont boldSystemFontOfSize:17];
    _passwordTextFiled.font = [UIFont boldSystemFontOfSize:17];
    _schoolLable.font = [UIFont boldSystemFontOfSize:17];
    _schoolLable.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"textFiled.png"]];
    _schoolLable.textColor = [UIColor grayColor];
    _accountTextFiled.delegate = self;
    _passwordTextFiled.delegate = self;

    if (!iPhone4) {
        _forgetButton.frame  = CGRectMake(20, ScreenHeight-60, 70,40);
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --
#pragma mark -- 代理学校名称传值
-(void)changeValue:(NSString *)school{
    _schoolLable.text = school;
    _schoolLable.textColor = [UIColor blackColor];
}



#pragma mark --
#pragma mark -- textFiledDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    self.view.frame = CGRectMake(0, 0,320 ,ScreenHeight );
    [_schoolTextFiled resignFirstResponder];
    [_accountTextFiled resignFirstResponder];
    [_passwordTextFiled resignFirstResponder];
    return  YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == _schoolTextFiled) {
        self.view.frame = CGRectMake(0, 0,320 ,ScreenHeight );
        [_schoolTextFiled resignFirstResponder];
        [_accountTextFiled resignFirstResponder];
        [_passwordTextFiled resignFirstResponder];
        ChooseShcoolViewController * chooseSchool = [[ChooseShcoolViewController alloc]init];
        UINavigationController * choose_nav = [[UINavigationController alloc]initWithRootViewController:chooseSchool];
        chooseSchool.title = @"选择学校";
//        chooseSchool.changeSchoolDelegate = self;
        [self presentViewController:choose_nav animated:YES completion:^{}];
        
    }else if(textField == _accountTextFiled){
        [_schoolTextFiled resignFirstResponder];
        [_passwordTextFiled resignFirstResponder];
        if (iPhone4) {
            self.view.frame = CGRectMake(0, -30,320 ,ScreenHeight );
        }
    }else if(textField == _passwordTextFiled){
        [_schoolTextFiled resignFirstResponder];
        [_accountTextFiled resignFirstResponder];
        if (iPhone4) {
            self.view.frame = CGRectMake(0, -30,320 ,ScreenHeight );

        }
    }
}

#pragma mark --
#pragma mark -- 平移坐标
-(void)moveView:(float)move{
    NSTimeInterval animationDuration = 0.50f;
    CGRect frame = self.view.frame;
    frame.origin.y +=move;//view的X轴上移
    self.view.frame = frame;
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];//设置调整界面的动画效果
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    self.view.frame = CGRectMake(0, 0,320,ScreenHeight);
    [_schoolTextFiled resignFirstResponder];
    [_accountTextFiled resignFirstResponder];
    [_passwordTextFiled resignFirstResponder];
}


#pragma mark --
#pragma mark -- requestDate(登陆)
//UserName:用户名,UserPwd:密码,DeviceToken
-(void)requestDate:(NSString *)loginState{
    if ([StuSaveUserDefaults getFirstLogin]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ROOT" object:@"ROOT"];

    }else{
        NSDictionary * dict = @{@"UserName":_accountTextFiled.text,
                                @"Password":[NSString_Encryption getSha1String:_passwordTextFiled.text],
                                @"LastLogonIp":@"123213",
                                };
        [ASAPIClient getLoginWithParameters:dict result:^(BOOL sucess, NSDictionary *results, NSError *error){
            if(sucess == YES){
                [StuSaveUserDefaults saveAccountAndPassWord:dict];
                [StuSaveUserDefaults saveFirstLogin:YES];
                NSLog(@"))))))))getLoginWithParameters******%@",results );
                NSLog(@"))))))))error******%@",error );
            }else{
                [self showToast:@"加载失败，稍后加载"];
            }
        }];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ROOT" object:@"ROOT"];
        
    }
   }

-(void)viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ROOT" object:nil];

}

//第一次登陆
//-(void)saveFirstlogin{
//    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:FIRSTLOGIN];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//
//}

////保存用户名密码
//-(void)saveNameAndpassword:(NSDictionary *)dict{
//    [StuSaveUserDefaults saveAccountAndPassWord:dict];
//}


#pragma mark --
#pragma mark -- 忘记密码方法
- (IBAction)forgetPassword:(id)sender {
    ForgetViewController * FORGET = [[ForgetViewController alloc]init];
    FORGET.title = @"找回密码";
    UINavigationController * FORGET_NAV = [[UINavigationController alloc]initWithRootViewController:FORGET];
    [self presentViewController:FORGET_NAV animated:YES completion:^{}];
}

#pragma mark --
#pragma mark -- 登陆方法
- (IBAction)loginWay:(id)sender {
    
    [_schoolTextFiled resignFirstResponder];
    [_accountTextFiled resignFirstResponder];
    [_passwordTextFiled resignFirstResponder];
    if (ISNULLSTR(_schoolLable.text)|| [_schoolLable.text isEqualToString:@"请选择学校"]) {
        [self showAlert:@"温馨提示" AndMessage:@"请选择学校"];
    }else if(ISNULLSTR(_accountTextFiled.text)){
        [self showAlert:@"温馨提示" AndMessage:@"请填写账号"];
    }else if(ISNULLSTR(_passwordTextFiled.text)){
        [self showAlert:@"温馨提示" AndMessage:@"请填写密码"];
    }else {
//        appDelegate.login_Way = loginWay_Already;
        [self requestDate:@"loginState"];

    }
    
}


- (IBAction)chooseSchoolPangesture:(id)sender {
//    [_schoolTextFiled resignFirstResponder];
    [_accountTextFiled resignFirstResponder];
    [_passwordTextFiled resignFirstResponder];
    self.view.frame = CGRectMake(0, 0,320 ,ScreenHeight );

    ChooseShcoolViewController * chooseSchool = [[ChooseShcoolViewController alloc]init];
    UINavigationController * choose_nav = [[UINavigationController alloc]initWithRootViewController:chooseSchool];
    chooseSchool.title = @"选择学校";
    chooseSchool.changeSchoolDelegate = self;
    [self presentViewController:choose_nav animated:YES completion:^{}];

}

- (IBAction)demonstrationWay:(id)sender {
//    appDelegate.login_Way = loginWay_Demonstrate;
   [self requestDate:@"demonstration"];
    
    
}
@end
