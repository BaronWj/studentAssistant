//
//  FTSlideAddViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/6.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTSlideController.h"
#import "BaseViewController.h"
//#import "ASActiveDynamicViewController.h"
#import "ViewController.h"
@interface FTSlideAddViewController : BaseViewController<FTSlideControllerDataSource,FTSlideControllerDelegate>
@property (nonatomic, retain)   FTSlideController *slideVC;
@end
