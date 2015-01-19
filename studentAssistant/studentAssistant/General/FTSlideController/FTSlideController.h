//
//  FTSlideController.h
//  FTSlideController
//
//  Created by FarTeen on 14-2-16.
//  Copyright (c) 2014年 lcworld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "defineSetting.h"
#import "BaseViewController.h"
#import "newlabelView.h"
//#import "FTSlideAddViewController.h"
@protocol FTSlideControllerDelegate;
@protocol FTSlideControllerDataSource;

@interface FTSlideController : UIViewController
{
    UIImageView * imageViewLine;
    UIButton * button_alert;
    UIButton * button_class;
    UIButton * button_schoolMes;
    UIButton * button_title;
    UIScrollView * top_scroller;
    NSMutableArray * array_title;
    UIButton * arrows_Button;
}
@property (nonatomic, assign)   id<FTSlideControllerDelegate>   slideDelegate;
@property (nonatomic, assign)   id<FTSlideControllerDataSource> slideDataSource;
@property (nonatomic, assign)   CGFloat                         upperHeight;
@property (nonatomic, strong)   newlabelView  * labelView;

@end

@protocol FTSlideControllerDataSource <NSObject>

- (NSInteger)numberOfSlideChildViewController:(FTSlideController *)slideVC;
- (UIViewController *)slideController:(FTSlideController *)slideVC viewControllerAtIndex:(NSInteger)index;

@end

@protocol FTSlideControllerDelegate <NSObject>
@optional
- (void)slideController:(FTSlideController *)slideVC stopScrollAndShowViewController:(UIViewController *)vc atIndex:(NSInteger)index;

@end
