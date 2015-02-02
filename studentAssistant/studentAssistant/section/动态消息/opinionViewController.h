//
//  opinionViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "BaseViewController.h"
#import "UITextField+common.h"
@interface opinionViewController : BaseViewController
@property (strong, nonatomic)  UITextField * titleTextFiled;//标题输入框
@property (strong, nonatomic)  UITextView  * commentTextView;//内容;
@end
