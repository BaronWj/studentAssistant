//
//  BaseViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()
{
    MBProgressHUD * HUD ;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    if(IsAfterIOS7){
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        //        self.modalPresentationCapturesStatusBarAppearance = YES;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];

    }
//    if (_isBackButton) {
//        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_backButton setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
//        [_backButton setBackgroundImage:[UIImage imageNamed:nil] forState:UIControlStateHighlighted];
//        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
//        [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        _backButton.frame = CGRectMake(0, 2,40, 14);
//        _backButton.imageEdgeInsets= UIEdgeInsetsMake(0,0, 0, 10);
//        _backButton.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0, 0);
//        _backButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        [_backButton addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
//        self.navigationItem.leftBarButtonItem = buttonItem;
//    }
//    //右边按钮
//    if (_isRightButton) {
//        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_rightButton setBackgroundImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
////        [_rightButton setBackgroundImage:[UIImage imageNamed:@"返回按下.png"] forState:UIControlStateHighlighted];
//        _rightButton.frame = CGRectMake(0, 0, 39, 27);
//        UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
//        self.navigationItem.leftBarButtonItem = buttonItem;
//    }
    
    self.navigationController.navigationBar.backgroundColor = nav_backGround;
    [self.navigationController.navigationBar setBarTintColor:nav_backGround];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topNav"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar.layer setMasksToBounds:YES];       // 剪切掉多余的背景
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor],
                                                                    UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
//    self.navigationController.navigationBar
//    UIView * titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
//    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    _titleButton.frame = CGRectMake(0, 0, 100, 40);
//    [_titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [titleView addSubview:_titleButton];
//    _titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:19];
//    self.navigationItem.titleView = titleView;
    
//     topNavImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 6.5)];
//    [self changeViewControllTitle:_navTitle];
    
    [self createShadow:YES];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
}

-(void)showMbProgressHud :(BOOL) showState{
    if (showState == YES) {
        HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:HUD];
        
        // Set determinate mode
        HUD.mode = MBProgressHUDModeAnnularDeterminate;
        
        HUD.delegate = self;
        HUD.labelText = @"Loading";
        
        // myProgressTask uses the HUD instance to update progress
        [HUD showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];

    }else{
//        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
        [HUD showWhileExecuting:@selector(hideMyProgressTask) onTarget:self withObject:nil animated:YES];
    }
  
}
- (void)myProgressTask {
    // This just increases the progress indicator in a loop
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        HUD.progress = progress;
        usleep(50000);
    }
}
- (void)hideMyProgressTask {
    // This just increases the progress indicator in a loop
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        HUD.progress = progress;
        usleep(50000);
    }
}


//set get方法
-(void)setNavTitle:(NSString *)navTitle{
    if (ISNULLSTR(navTitle)) {
        _navTitle =  navTitle;
        [_titleButton setTitle:navTitle forState:UIControlStateNormal];
    }

}

-(void)changeViewControllTitle: (NSString *)selectViewtitle{
        [_titleButton setTitle:selectViewtitle forState:UIControlStateNormal];
}

-(void)createShadow :(BOOL)Show{
    if (Show == YES) {
        topNavImage.image = [UIImage imageNamed:@"nav02@2x"];
        topNavImage.hidden = NO;
        [self.view addSubview:topNavImage];
    }else{
        topNavImage.hidden = YES;
    }
    
    
}

-(void)showAlert :(NSString *)title AndMessage:(NSString *)Message{
    
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:Message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)showToast:(NSString *)format, ...{
    if(!ISNULLSTR(format)){
        va_list args;
        va_start(args, format);
        
        NSString *str = [[NSString alloc]  initWithFormat:format arguments:args];
        va_end(args);
        [ALToastView toastInView:self.navigationController.view withText:str];
        
    }

}

#pragma mark - Button Aciton
- (void)backBtnAction {
    leverTab.animateDriect = 1;
    [leverTab hidesTabBar:NO animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if (viewController.hidesBottomBarWhenPushed)
//    {
//        [leverTab hidesTabBar:YES animated:YES];
//    }
//    else
//    {
//        [leverTab hidesTabBar:NO animated:YES];
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
