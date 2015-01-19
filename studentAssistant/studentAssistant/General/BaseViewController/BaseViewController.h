//
//  BaseViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"
#import "UITableView+tableViewExtraCellHidden.h"

@interface BaseViewController : UIViewController<UINavigationControllerDelegate>{
    LeveyTabBarController * leverTab;
    BOOL isHiddenStatusBar;
    UIImageView * topNavImage;

}
@property(nonatomic,strong) UIButton * backButton;
@property(nonatomic,strong) UIButton * rightButton;
@property(nonatomic,assign) BOOL isBackButton;   //是否要显示返回按钮
@property(nonatomic,assign) BOOL isRightButton; //是否需要显示右边的按钮
@property(nonatomic,strong) UIButton * titleButton;
@property(nonatomic,strong) NSString * navTitle;//标题
//-(void)showStatusBar;
//-(void)hideStatusBar;
-(void)createShadow :(BOOL)Show;
-(void)showAlert :(NSString *)title AndMessage:(NSString *)Message;
-(void)backBtnAction;
-(void) showToast:(NSString *) format , ...;
-(void)changeViewControllTitle: (NSString *)selectViewtitle;
@end
