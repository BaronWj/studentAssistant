//
//  ModifyPwdViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UITextField+common.h"
@interface ModifyPwdViewController : BaseViewController<UITextFieldDelegate>
@property (strong, nonatomic)  UITextField *oldPassWordTextFiled;
@property (strong, nonatomic)  UITextField *nowPassWordTextFiled;
@property (strong, nonatomic)  UITextField *againPassWordTextFiled;

@end
