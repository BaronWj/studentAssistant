//
//  ForgetViewController.m
//  StudentAssistant
//
//  Created by 迈艾普 on 14-2-28.
//  Copyright (c) 2014年 Baron. All rights reserved.
//

#import "ForgetViewController.h"
#import "FormValidateUtil.h"
//#import "StuAppDelegate.h"
@interface ForgetViewController ()
{
//    StuAppDelegate * appDelegate;
}
@end

@implementation ForgetViewController

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
    // Do any additional setup after loading the view from its nib.
//    appDelegate=(StuAppDelegate*)[[UIApplication sharedApplication] delegate];

    UIButton * right_button = [UIButton buttonWithType:UIButtonTypeCustom];
    right_button.frame = CGRectMake(0, 0, 47, 30);
    right_button.titleLabel.font = [UIFont systemFontOfSize:15];
    [right_button setTitle:@"取消" forState:UIControlStateNormal];
//    [right_button setTitleColor:[UIColor blackColor] forState:YES];
//    [right_button setBackgroundImage:[UIImage imageNamed:@"按钮_07"] forState:UIControlStateNormal];
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:right_button];
    self.navigationItem.rightBarButtonItem =rightBarButton;
    [right_button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    _emailTextFiled.delegate = self;
}

-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

// [[UIColororangeColor] setFill];


#pragma mark --
#pragma mark -- 代理学校名称传值
-(void)changeValue:(NSString *)school{
    _schoolLabel.text = school;
    _schoolLabel.textColor = [UIColor blackColor];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_emailTextFiled resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)FindE_mailWay:(id)sender {
//    NSLog(@"找回密码");
   if(![self isEmailVerify:_emailTextFiled.text]){
        [self showAlert:@"温馨提示" AndMessage:@"请您输入邮箱"];
    }else{
//        if ([appDelegate.login_Way isEqualToString:loginWay_Demonstrate]) {
//            
//        }else{
////            [self requestData];
//        }
    }
}


-(BOOL) isEmailVerify:(NSString *)email
{
    if (ISNULLSTR(email)) {
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return ([emailTest evaluateWithObject:email] == YES);
    
}


- (IBAction)tapSchoolWay:(id)sender {
//    NSLog(@"选择学校");
    ChooseShcoolViewController * chooseSchoole = [[ChooseShcoolViewController alloc]init];
    UINavigationController * CHOOSE_NAV = [[UINavigationController alloc]initWithRootViewController:chooseSchoole];
    chooseSchoole.title = @"选择学校";
//    chooseSchoole.changeSchoolDelegate = self;
    [self presentViewController:CHOOSE_NAV animated:YES completion:^{}];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [super touchesBegan:touches withEvent:event];
    [_emailTextFiled resignFirstResponder];

}

//-(void)requestData{
////    NSDictionary * peopleInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginMessage"];
//    NSDictionary * dict = @{
//                            @"Email":_emailTextFiled.text,
////                            @"TeacherID":[peopleInfo valueForKey:@"TeacherID"],
//                            };
//    [[RequestCenter sharedRequestCenter] requestNet:dict setUrl:@"/FindPassword" SetSuccessBlock:^(NSDictionary * data_Dict){
////        NSLog(@"DATA___%@",[data_Dict objectForKey:@"Message"]);
//        [self showAlert:@"温馨提示" AndMessage:[data_Dict objectForKey:@"Message"]];
//    } setFaileBlock:^(NSDictionary * data_Dict){
//        
//    }];
//    
//}

@end
