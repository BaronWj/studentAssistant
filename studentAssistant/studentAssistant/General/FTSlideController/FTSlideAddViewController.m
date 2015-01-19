//
//  FTSlideAddViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/6.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "FTSlideAddViewController.h"
//#import "CollectionViewController.h"
@interface FTSlideAddViewController ()
{
    

}

@end

@implementation FTSlideAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self changeViewControllTitle:@"新闻"];
    _slideVC = [[FTSlideController alloc] init];
    _slideVC.view.backgroundColor = [UIColor clearColor];
    _slideVC.view.userInteractionEnabled = YES;
    _slideVC.slideDataSource = self;
    _slideVC.slideDelegate = self;
    [self addChildViewController:_slideVC];
    [self.view addSubview:_slideVC.view];
    _slideVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.width);
    
    UIButton * _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
    //    [_rightButton setBackgroundImage:[UIImage imageNamed:@"返回按下.png"] forState:UIControlStateHighlighted];
    _rightButton.frame = CGRectMake(0, 0, 24, 24);
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = buttonItem;
    [_rightButton addTarget:self action:@selector(pressCollection:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)pressCollection:(id)sender{
//    CollectionViewController * collection = [[CollectionViewController alloc]init];
//    [collection changeViewControllTitle:@"收藏"];
//    collection.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:collection animated:YES];
}


#pragma mark ---
#pragma mark --- FTSlideControllDelegate
- (NSInteger)numberOfSlideChildViewController:(FTSlideController *)slideVC
{
    return 4;
}

- (UIViewController *)slideController:(FTSlideController *)slideVC viewControllerAtIndex:(NSInteger)index
{
//    if (index == 0) {
////        ASActiveDynamicViewController * ASActiveDynamic = [[ASActiveDynamicViewController alloc]init];
////        return ASActiveDynamic;
//    }else if(index ==1){
//        ASActiveDynamicViewController * ASActiveDynamic = [[ASActiveDynamicViewController alloc]init];
//        return ASActiveDynamic;
//    }else if(index ==2){
//        ASActiveDynamicViewController * ASActiveDynamic = [[ASActiveDynamicViewController alloc]init];
//        return ASActiveDynamic;
//    }else if(index ==3){
//        ASActiveDynamicViewController * ASActiveDynamic = [[ASActiveDynamicViewController alloc]init];
//        return ASActiveDynamic;
//    }else{
//        ASActiveDynamicViewController * ASActiveDynamic = [[ASActiveDynamicViewController alloc]init];
//        return ASActiveDynamic;
//    }
    return nil;
 }

- (void)slideController:(FTSlideController *)slideVC stopScrollAndShowViewController:(UIViewController *)vc atIndex:(NSInteger)index
{
        NSLog(@"slide stop scroll at index %ld",(long)index);
    //    NSLog(@"slide stop scroll at index %@",vc);
    
//    if (index == 0) {
//        [self requestGetNewestMsgList];
//    }else if(index == 1){
//        [self requestGetMsgListBySchool];
//    }else if(index == 2){
//        [self requestGetMsgListByClass];
//    }else if(index == 3){
//        [self requestGetMsgListByRemind];
//    }
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
