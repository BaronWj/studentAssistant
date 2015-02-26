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


@interface SchoolInChatViewController ()<MLKMenuPopoverDelegate,UIScrollViewDelegate>
{
    UIButton * _rightButton;
}
@property(nonatomic, strong) MLKMenuPopover *menuPopover;
@property(nonatomic, strong) NSArray *menuItems;
@property(nonatomic, strong) NSArray *imageArray;
@property(nonatomic, strong) UIScrollView * schoolChat_scro;
@property(nonatomic, strong) UIView * topView;
@end

@implementation SchoolInChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //    addFriend
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.frame =CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    //    self.view.backgroundColor = [UIColor redColor];
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    _rightButton.frame = CGRectMake(0, 0, 19, 15);
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = buttonItem;
    [_rightButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.menuItems = [NSArray arrayWithObjects:@"添加好友", @"发起群聊",@"聊天设置", nil];
    self.imageArray = [NSArray arrayWithObjects:@"添加好友", @"发起群聊",@"聊天设置", nil];
    
    _schoolChat_scro= [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 44-40-35 )];
    _schoolChat_scro.backgroundColor =backGround;
    _schoolChat_scro.pagingEnabled = YES;
    _schoolChat_scro.delegate = self;
    [self.view addSubview:_schoolChat_scro];
    
    NSArray * array = @[@"最新",@"通讯录",@"校内圈",@"群聊"];
    [self createTitleTopView:array];
    [self changeViewControllTitle:@"校内聊"];
    [self createViewController];
    
}


#pragma mark
#pragma mark--标题字体颜色的改变
-(void)changeButtonColor:(NSInteger)buttonTag{
    UIView * view_button;
    for ( view_button in [_topView subviews]) {
        //        NSLog(@"++++++%@",[top_scroller subviews]);
        if ([view_button isKindOfClass:[UIButton class]]) {
            if (((UIButton *)view_button).tag == buttonTag) {
                [((UIButton *)view_button) setTitleColor:nav_backGround forState:UIControlStateNormal];
                NSLog(@"蓝颜色");
                [UIView animateWithDuration:0.2 animations:^{
                } completion:^(BOOL finish){
                    
                }];
                
            }else{
                [((UIButton *)view_button) setTitleColor:UIColorFromRGB(0x5b5b5b) forState:UIControlStateNormal];
                //                NSLog(@"黑颜色");
                
            }
        }
    }
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
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    [self.view addSubview:_topView];
    for (int i = 0; i < titleValue.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0 + ScreenWidth/titleValue.count * i, 0, ScreenWidth/titleValue.count , 40);
        [button setTitle:[titleValue  objectAtIndex:i]forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        if (i == 0) {
            [button setTitleColor:nav_backGround forState:UIControlStateNormal];
        }else{
            [button setTitleColor:UIColorFromRGB(0x5b5b5b)  forState:UIControlStateNormal];
        }
        button.tag = 10000 + i;
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:button];
    }
    
}

-(void)pressButton:(UIButton*)buttonTag{
    UIViewController *childVC = self.childViewControllers[buttonTag.tag-10000];
    childVC.view.frame = CGRectMake((buttonTag.tag-10000) * ScreenWidth, 40, ScreenWidth, _schoolChat_scro.bounds.size.height);
    [_schoolChat_scro addSubview:childVC.view];
    _schoolChat_scro.contentOffset =CGPointMake(ScreenWidth * (buttonTag.tag - 10000), 0);
    [self changeButtonColor:buttonTag.tag];
}


-(void)createViewController{
    self.recentlyChatView = [[NewChatViewController alloc]init];
    self.recentlyChatView.view.frame = CGRectMake(0, 40, ScreenWidth, ScreenHeight-40);
    [self addChildViewController:self.recentlyChatView];
    
    self.addressBook = [[AddressBookViewController alloc]init];
    self.addressBook.view.frame = CGRectMake(ScreenWidth , 40, ScreenWidth, ScreenHeight-40);
    [self addChildViewController:self.addressBook];
    
    
    self.schoolCircle = [[SchoolCircleViewController alloc]init];
    self.schoolCircle.view.frame = CGRectMake(ScreenWidth *2, 40, ScreenWidth, ScreenHeight-40);
    [self addChildViewController:self.schoolCircle];
    
    
    
    self.groupChat = [[GroupChatViewController alloc]init];
    self.groupChat.view.frame = CGRectMake(ScreenWidth *3, 40, ScreenWidth, ScreenHeight - 40);
    [self addChildViewController:self.groupChat];
    
    
    self.cuurentViewController = self.recentlyChatView;
    
    [_schoolChat_scro addSubview:self.recentlyChatView.view];
    [_schoolChat_scro addSubview:self.addressBook.view];
    [_schoolChat_scro addSubview:self.schoolCircle.view];
    [_schoolChat_scro addSubview:self.groupChat.view];
    
    
    _schoolChat_scro.contentSize = CGSizeMake(ScreenWidth * 4,  ScreenHeight - 44-40-35);
    NSLog(@"___%@",[self childViewControllers]);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger currentPage = (NSInteger)_schoolChat_scro.contentOffset.x / ScreenWidth;
    UIViewController *childVC = self.childViewControllers[currentPage];
    [_schoolChat_scro addSubview:childVC.view];
    childVC.view.frame = CGRectMake(currentPage * ScreenWidth, 40, ScreenWidth, _schoolChat_scro.bounds.size.height);
    [self changeButtonColor:currentPage + 10000];
    
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
