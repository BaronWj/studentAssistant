//
//  BaseViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "BaseViewController.h"
#import "defineSetting.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = backGround;
    if(IsAfterIOS7){
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        //        self.modalPresentationCapturesStatusBarAppearance = YES;
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
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"topNav"] forBarMetrics:UIBarMetricsDefault];
    UIView * titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.frame = CGRectMake(0, 0, 100, 40);
    [_titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [titleView addSubview:_titleButton];
    _titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    self.navigationItem.titleView = titleView;
    
     topNavImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 6.5)];
//    [self changeViewControllTitle:_navTitle];
    
    [self createShadow:YES];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
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

}

-(void)showToast:(NSString *)format, ...{

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
