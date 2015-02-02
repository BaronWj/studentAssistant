//
//  ASActiveDetailsViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//  新闻详情

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface ASActiveDetailsViewController : BaseViewController{
    LeveyTabBarController *leveyTabBarController;

}
@property(nonatomic,strong)NSString * activeNewID;
@end
