//
//  SchoolInChatViewController.m
//  studentAssistant
//
//  Created by MyUpinup on 15/2/2.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "SchoolInChatViewController.h"
#import "MLKMenuPopover.h"
#define MENU_POPOVER_FRAME  CGRectMake(100, 0, 140, 88)

@interface SchoolInChatViewController ()<MLKMenuPopoverDelegate>
{
    
        UIButton * _rightButton;
    
}
@property(nonatomic,strong) MLKMenuPopover *menuPopover;
@property(nonatomic,strong) NSArray *menuItems;
@property(nonatomic,strong) NSArray *imageArray;
@end

@implementation SchoolInChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.frame =CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    //    self.view.backgroundColor = [UIColor redColor];
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    _rightButton.frame = CGRectMake(0, 0, 19, 15);
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = buttonItem;
    [_rightButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.menuItems = [NSArray arrayWithObjects:@"添加好友", @"建立群组", nil];
    self.imageArray = [NSArray arrayWithObjects:@"添加好友", @"建立群组", nil];
    
    NSArray * array = @[@"最新",@"通讯录",@"校内圈",@"群聊"];
    [self createTitleTopView:array];
    //    self
    [self changeViewControllTitle:@"校内聊"];
    [self createViewController];

}
-(void)showMenu:(UIButton *)sender{
    if (sender.selected == NO) {
        [self.menuPopover dismissMenuPopover];
        self.menuPopover = [[MLKMenuPopover alloc] initWithFrame:CGRectMake(ScreenWidth - 150, 0, 140, 88) menuItems:self.menuItems withTitleImage:self.imageArray];
        self.menuPopover.menuPopoverDelegate = self;
        [self.menuPopover showInView:self.view];
        sender.selected = YES;
    }else{
        [self.menuPopover dismissMenuPopover];
        sender.selected = NO;
    }
}

//标题栏
-(void)createTitleTopView:(NSArray *)titleValue{
    for (int i = 0; i < titleValue.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0 + ScreenWidth/titleValue.count * i, 0, ScreenWidth/titleValue.count , 40);
        [button setTitle:[titleValue  objectAtIndex:i]forState:UIControlStateNormal];
        [button setTitleColor:labelTextColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.view addSubview:button];
        button.tag = 10000 + i;
        //        button.userInteractionEnabled = YES;
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}


//#pragma mark
//#pragma mark--标题字体颜色的改变
//-(void)changeButtonColor:(NSInteger)buttonTag{
//    UIView * view_button;
//    for ( view_button in [top_scroller subviews]) {
//        //        NSLog(@"++++++%@",[top_scroller subviews]);
//        if ([view_button isKindOfClass:[UIButton class]]) {
//            if (((UIButton *)view_button).tag == buttonTag) {
//                [((UIButton *)view_button) setTitleColor:nav_backGround forState:UIControlStateNormal];
//                NSLog(@"蓝颜色");
//                [UIView animateWithDuration:0.2 animations:^{
//                    imageViewLine.frame = CGRectMake(view_button.frame.origin.x, 0, view_button.frame.size.width, 40);
//                } completion:^(BOOL finish){
//                    
//                }];
//                
//            }else{
//                [((UIButton *)view_button) setTitleColor:UIColorFromRGB(0x5b5b5b) forState:UIControlStateNormal];
//                //                NSLog(@"黑颜色");
//                
//            }
//        }
//    }
//}

-(void)pressButton:(UIButton*)buttonTag{
    
    if ((self.cuurentViewController == self.recentlyChatView&& buttonTag.tag == 10000)||(self.cuurentViewController == self.addressBook&& buttonTag.tag == 10001)||(self.cuurentViewController == self.schoolCircle&& buttonTag.tag == 10002)||(self.cuurentViewController == self.groupChat&& buttonTag.tag == 10003)){
        return;
    }else{
        switch (buttonTag.tag) {
            case 10000:
                [self replaceController:self.cuurentViewController newController:self.recentlyChatView];
                break;
            case 10001:
                [self replaceController:self.cuurentViewController newController:self.addressBook];
                break;
            case 10002:
                [self replaceController:self.cuurentViewController newController:self.schoolCircle];
                break;
            case 10003:
                [self replaceController:self.cuurentViewController newController:self.groupChat];
                break;
                
            default:
                break;
        }
    }
}

//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController

{
    /**
     
     *            着重介绍一下它
     
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     
     *  toViewController        将要显示的姿势图控制器
     
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     
     *  options                 动画效果(渐变,从下往上等等,具体查看API)
     
     *  animations              转换过程中得动画
     
     *  completion              转换完成
     
     */
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.cuurentViewController = newController;
        }else{
            self.cuurentViewController = oldController;
            
        }
        
    }];
    
}


-(void)createViewController{
    self.recentlyChatView = [[NewChatViewController alloc]init];
    self.recentlyChatView.view.frame = CGRectMake(0, 40, ScreenWidth, ScreenHeight-40);
    [self addChildViewController:self.recentlyChatView];
    
    self.schoolCircle = [[SchoolCircleViewController alloc]init];
    self.schoolCircle.view.frame = CGRectMake(0, 40, ScreenWidth, ScreenHeight-40);
    
    self.addressBook = [[AddressBookViewController alloc]init];
    self.addressBook.view.frame = CGRectMake(0, 40, ScreenWidth, ScreenHeight-40);
    
    
    self.groupChat = [[GroupChatViewController alloc]init];
    self.groupChat.view.frame = CGRectMake(0, 40, ScreenWidth, ScreenHeight - 40);
    
    self.cuurentViewController = self.recentlyChatView;
    [self.view addSubview:self.recentlyChatView.view];
    
    
    NSLog(@"___%@",[self childViewControllers]);
}




#pragma mark -
#pragma mark MLKMenuPopoverDelegate
- (void)menuPopover:(MLKMenuPopover *)menuPopover didSelectMenuItemAtIndex:(NSInteger)selectedIndex
{
    [self.menuPopover dismissMenuPopover];
    NSString *title = [NSString stringWithFormat:@"%@ selected.",[self.menuItems objectAtIndex:selectedIndex]];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
}


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
