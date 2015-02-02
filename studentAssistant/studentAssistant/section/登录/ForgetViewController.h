//
//  ForgetViewController.h
//  StudentAssistant
//
//  Created by 迈艾普 on 14-2-28.
//  Copyright (c) 2014年 Baron. All rights reserved.
//

#import "BaseViewController.h"
#import "ChooseShcoolViewController.h"
//#import "Stu_drawTextFiled.h"
@interface ForgetViewController : BaseViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton * find_Button;
@property (weak, nonatomic) IBOutlet UILabel * schoolLabel;
- (IBAction)FindE_mailWay:(id)sender;//通过邮箱找回密码button方法
- (IBAction)tapSchoolWay:(id)sender;//选择学校手势方法
@property (weak, nonatomic) IBOutlet UITextField * emailTextFiled;

@end
