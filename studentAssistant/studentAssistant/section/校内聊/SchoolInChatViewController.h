//
//  SchoolInChatViewController.h
//  studentAssistant
//
//  Created by MyUpinup on 15/2/2.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SchoolCircleViewController.h"
#import "AddressBookViewController.h"
#import "NewChatViewController.h"
#import "GroupChatViewController.h"
#import "UIViewController+FindTabView.h"
@interface SchoolInChatViewController : BaseViewController
@property(strong, nonatomic) UIViewController * cuurentViewController;
@property(strong, nonatomic) SchoolCircleViewController * schoolCircle;//校内圈
@property(strong, nonatomic) AddressBookViewController * addressBook;//通讯录
@property(strong, nonatomic) NewChatViewController * recentlyChatView;//最新聊天
@property(strong, nonatomic) GroupChatViewController * groupChat;//群聊
@end
