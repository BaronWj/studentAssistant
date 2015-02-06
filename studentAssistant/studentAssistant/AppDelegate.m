//
//  AppDelegate.m
//  studentAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "AppDelegate.h"
#import "FTSlideAddViewController.h"
#import "PeopleMessViewController.h"
#import "StudyViewController.h"
#import "SchoolInChatViewController.h"
#import "ASActiveDynamicViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()<UINavigationControllerDelegate>

@end

@implementation AppDelegate


-(void)initTabBarViewController{
    
    
    
    FTSlideAddViewController * newActiveDynamic = [[FTSlideAddViewController alloc]init];
    UINavigationController * newActiveDynamic_nav = [[UINavigationController alloc]initWithRootViewController:newActiveDynamic];
    newActiveDynamic_nav.delegate = self;
    newActiveDynamic.title = @"新闻";
    
    StudyViewController * studyManage = [[StudyViewController alloc]init];
//    [studyManage changeViewControllTitle:@"教学教务"];
    studyManage.title = @"教学教务";
    UINavigationController * study_nav = [[UINavigationController alloc]initWithRootViewController:studyManage];
    study_nav.delegate = self;
    
    
    SchoolInChatViewController * schoolChat = [[SchoolInChatViewController alloc]init];
//    [schoolChat changeViewControllTitle:@"校内聊"];
    schoolChat.title = @"校内聊";
    UINavigationController * schoolChat_nav = [[UINavigationController alloc]initWithRootViewController:schoolChat];
    schoolChat_nav.delegate = self;
    
    PeopleMessViewController * peopleMessage = [[PeopleMessViewController alloc]init];
//    [schoolChat changeViewControllTitle:@"我"];
    peopleMessage.title = @"我";
    UINavigationController * peopleMessage_nav = [[UINavigationController alloc]initWithRootViewController:peopleMessage];
    peopleMessage_nav.delegate = self;
    
    NSArray *ctrlArr = [NSArray arrayWithObjects:newActiveDynamic_nav,
                        study_nav,
                        schoolChat_nav,
                        peopleMessage_nav,nil];
    
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic setObject:[UIImage imageNamed:@"news"] forKey:@"Default"];
    [imgDic setObject:[UIImage imageNamed:@"newsSelected"] forKey:@"Highlighted"];
    [imgDic setObject:[UIImage imageNamed:@"newsSelected"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic2 setObject:[UIImage imageNamed:@"study"] forKey:@"Default"];
    [imgDic2 setObject:[UIImage imageNamed:@"studySelected"] forKey:@"Highlighted"];
    [imgDic2 setObject:[UIImage imageNamed:@"studySelected"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic3 setObject:[UIImage imageNamed:@"schoolChat"] forKey:@"Default"];
    [imgDic3 setObject:[UIImage imageNamed:@"schoolChatSelected"] forKey:@"Highlighted"];
    [imgDic3 setObject:[UIImage imageNamed:@"schoolChatSelected"] forKey:@"Seleted"];
//    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
//    [imgDic4 setObject:[UIImage imageNamed:@"点击前_07"] forKey:@"Default"];
//    [imgDic4 setObject:[UIImage imageNamed:@"点击后_07"] forKey:@"Highlighted"];
//    [imgDic4 setObject:[UIImage imageNamed:@"点击后_07"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic5 setObject:[UIImage imageNamed:@"me"] forKey:@"Default"];
    [imgDic5 setObject:[UIImage imageNamed:@"meSelected"] forKey:@"Highlighted"];
    [imgDic5 setObject:[UIImage imageNamed:@"meSelected"] forKey:@"Seleted"];
    //
    NSArray *imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,imgDic5,nil];
    
    
    leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr];
    [leveyTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar"]];
    [leveyTabBarController setTabBarTransparent:YES];
    self.window.rootViewController = leveyTabBarController;
    
    
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if (navigationController.hidesBarsOnSwipe) {
//        MyLog(@"navigationController.hidesBarsOnSwipe");
//    }else{
//        MyLog(@"navigationController.hidesBarsOnSwipe == yes");
//        
//    }
    
    if (viewController.hidesBottomBarWhenPushed)
    {
        MyLog(@"navigationController.hidesBarsPush == yes");
        
        [leveyTabBarController hidesTabBar:YES animated:YES];
    }
    else
    {
        MyLog(@"navigationController.hidesBarsPush == No");
        [leveyTabBarController hidesTabBar:NO animated:YES];
    }
}
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController.hidesBottomBarWhenPushed)
    {
        [leveyTabBarController hidesTabBar:YES animated:YES];
    }
    else
    {
        [leveyTabBarController hidesTabBar:NO animated:YES];
    }
    
}

//登录
-(void)judgeLoginState{
    [self initTabBarViewController];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(judgeLoginState) name:@"ROOT" object:nil];

    self.appdelegate = iPhoneDelegate;
//        self.appdelegate.requestUrl = @"http://192.168.1.200:8281/";
    self.appdelegate.requestUrl = @"http://192.168.1.10:8281";
//   self.appdelegate.requestUrl =@"http://app.nandu.com";
//    self.appdelegate.requestUrl = @"http://192.168.1.112:8212";
    if ([StuSaveUserDefaults getFirstLogin]){
        [self initTabBarViewController];
        
    }else{
        
        LoginViewController * loginView = [[LoginViewController alloc]init];
        UINavigationController * loginNav = [[UINavigationController alloc]initWithRootViewController:loginView];
        loginNav.navigationBarHidden = YES;
        self.window.rootViewController = loginNav;
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
