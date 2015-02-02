//
//  AppDelegate.h
//  studentAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"

@class LeveyTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    LeveyTabBarController *leveyTabBarController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) LeveyTabBarController *leveyTabBarController;
@property (strong, nonatomic) NSString * requestUrl;
@property (strong, nonatomic) AppDelegate * appdelegate;
@end

