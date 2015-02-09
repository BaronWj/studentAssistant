//
//  FTSlideController.m
//  FTSlideController
//
//  Created by FarTeen on 14-2-16.
//  Copyright (c) 2014年 lcworld. All rights reserved.
//

#import "FTSlideController.h"
CGFloat const topHeight = 40;
#import "ViewController.h"
#import "asActiveSetting.h"
@interface FTSlideController () <UIScrollViewDelegate,chooselabelDlegate>
@property (nonatomic, assign)   CGFloat          max_width;
@property (nonatomic, retain)   UIScrollView    *titleScroll;
@property (nonatomic, retain)   UIScrollView    *contentScroll;
@property (nonatomic, assign)   NSInteger       totalPages;
@property (strong, nonatomic)   NSArray         * asActiveModelArray;
@property (nonatomic, assign)   CGFloat          firstbuttonW;
@end

@implementation FTSlideController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _contentScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topHeight, ScreenWidth, self.view.bounds.size.height - topHeight)];
    _contentScroll.delegate = self;
    _contentScroll.pagingEnabled = YES;
    [self.view addSubview:_contentScroll];
    self.max_width = 20;

    array_title = [[NSMutableArray alloc]initWithCapacity:0];
}


-(void)cretaAsactiveLabel:(NSArray*)asActivity{
    //顶部scrollerView
    top_scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth-40, topHeight)];
    top_scroller.backgroundColor = [UIColorFromRGB(0xe3e4e4) colorWithAlphaComponent:0.0];
    [self.view addSubview:top_scroller];
    top_scroller.userInteractionEnabled = YES;
    top_scroller.showsHorizontalScrollIndicator = NO;
    [self createButton:array_title];
    
    
    _labelView = [[newlabelView alloc]init];
    _labelView.labeldelegate = self;
    _labelView.backgroundColor = backGround;
    _labelView.frame = CGRectMake(0, -ScreenHeight, ScreenWidth, ScreenHeight);
    [self.view addSubview:_labelView];
    
    arrows_Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [arrows_Button setBackgroundImage:[UIImage imageNamed:@"arrows"] forState:UIControlStateNormal];
    arrows_Button.frame = CGRectMake(ScreenWidth-30, 15, 13, 9) ;
    [arrows_Button addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:arrows_Button];
    
    _firstbuttonW = [self calculateSizeWithFont:16 Width:MAXFLOAT Height:conditionScrollH Text:[array_title firstObject]].size.width;
    imageViewLine = [[UIImageView alloc]init];
    imageViewLine.image = [UIImage imageNamed:@"red_line_and_shadow@2x"];
    imageViewLine.frame = CGRectMake(20, 0, _firstbuttonW, 40);
    imageViewLine.backgroundColor = [UIColor clearColor];
    [top_scroller addSubview:imageViewLine];


    
}

//mewlabelView 代理
-(void)chooseLabelValue:(NSString *)labelValue{
    NSLog(@"labelValue_title");
    [array_title addObject:labelValue];
    arrows_Button.selected = YES;
    [self startAnimation];
    [self updateScroller];
    _totalPages = [array_title count];
    [self createSubView:array_title.count];
    dispatch_queue_t queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
         //2.添加任务到队列中，就可以执行任务
         //异步函数：具备开启新线程的能力
         dispatch_async(queue, ^{
                 NSLog(@"下载图片1----%@",[NSThread currentThread]);
//             FTSlideAddViewController * ftslideAdd = [[FTSlideAddViewController alloc]init];

    });
}

-(void)updateScroller{
    top_scroller.contentSize = CGSizeMake([array_title count] * 70 , topHeight);
    _contentScroll.contentSize = CGSizeMake([array_title count] * ScreenWidth , self.view.bounds.size.height - topHeight);
    [self createButton:array_title];
}




- (void)startAnimation
{
    if (arrows_Button.selected) {
        [UIView animateWithDuration:0.45 animations:^(){
            arrows_Button.transform=CGAffineTransformMakeRotation(0);
            arrows_Button.selected = NO;
            [_labelView initDrawRect:CGRectMake(0, -ScreenHeight, ScreenWidth, ScreenHeight)];

        } completion:^(BOOL finish){
            
        }];
    }else{
        [UIView animateWithDuration:0.45 animations:^(){
            arrows_Button.transform=CGAffineTransformMakeRotation(M_PI);
            [_labelView initDrawRect:CGRectMake(0, topHeight, ScreenWidth, ScreenHeight)];
            arrows_Button.selected = YES;
        } completion:^(BOOL finish){
            
        }];

    }
}



//添加顶部button
-(void)createButton :(NSArray *)buttonTitle{
    self.max_width = 20;

    if([top_scroller subviews]){
        //依次遍历self.view中的所有子视图
        for(id tmpView in [top_scroller subviews])
        {
            //找到要删除的子视图的对象
            if([tmpView isKindOfClass:[UIButton class]]){
                [tmpView removeFromSuperview];
            }
        }
        for (int i = 0; i < [buttonTitle count]; i++) {
            CGFloat buttonW = [self calculateSizeWithFont:16 Width:MAXFLOAT Height:conditionScrollH Text:[buttonTitle objectAtIndex:i]].size.width;
            UIButton * newButton = [UIButton buttonWithType:UIButtonTypeCustom];
            newButton.frame = CGRectMake(self.max_width, 0, buttonW, 40);
            newButton.tag = 1000+i;
            newButton.titleLabel.textAlignment = NSTextAlignmentCenter;
            if (i==0) {
                [newButton setTitleColor:nav_backGround forState:UIControlStateNormal];
            }else{
                [newButton setTitleColor:UIColorFromRGB(0x5b5b5b) forState:UIControlStateNormal];
            }
            [newButton setTitle:[buttonTitle objectAtIndex:i] forState:UIControlStateNormal];
            newButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
            [newButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [top_scroller addSubview:newButton];
            self.max_width += buttonW+20;

        }
        top_scroller.contentSize = CGSizeMake(self.max_width, topHeight);
    }else{
    
    }
}

//根据字的数量确定button的长度
-(CGRect)calculateSizeWithFont:(NSInteger)Font Width:(NSInteger)Width Height:(NSInteger)Height Text:(NSString *)Text
{
    NSDictionary *attr = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:Font]};
    CGRect size = [Text boundingRectWithSize:CGSizeMake(Width, Height)
                                     options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attr
                                     context:nil];
    return size;
}

-(void)pressButton :(UIButton *)sender{
    [UIView animateWithDuration:0.2 animations:^{
        imageViewLine.frame = CGRectMake(sender.frame.origin.x, 0, sender.frame.size.width, 40);
    } completion:^(BOOL finish){
        [self createSubView:sender.tag - 1000];
    }];
      [self changeButtonColor:sender.tag];
}
#pragma mark
#pragma mark--标题字体颜色的改变
-(void)changeButtonColor:(NSInteger)buttonTag{
    UIView * view_button;
    for ( view_button in [top_scroller subviews]) {
        //        NSLog(@"++++++%@",[top_scroller subviews]);
        if ([view_button isKindOfClass:[UIButton class]]) {
            if (((UIButton *)view_button).tag == buttonTag) {
                [((UIButton *)view_button) setTitleColor:nav_backGround forState:UIControlStateNormal];
                                NSLog(@"蓝颜色");
                [UIView animateWithDuration:0.2 animations:^{
                   imageViewLine.frame = CGRectMake(view_button.frame.origin.x, 0, view_button.frame.size.width, 40);
                } completion:^(BOOL finish){
                                
                }];

            }else{
                [((UIButton *)view_button) setTitleColor:UIColorFromRGB(0x5b5b5b) forState:UIControlStateNormal];
                //                NSLog(@"黑颜色");
                
            }
        }
    }
}

#pragma mark -- 
#pragma mark -- 点击title滚动scrollow
-(void)createSubView:(NSInteger)currentPage{
   if (currentPage > [self.childViewControllers count]) {
//        ViewController * addViewController = [[ViewController alloc]init];
//        addViewController.view.frame = CGRectMake(currentPage * ScreenWidth, 0, ScreenWidth, _contentScroll.bounds.size.height);
//        UIViewController *pageVC = addViewController;
//        [self addChildViewController:pageVC];
//        [_contentScroll addSubview:pageVC.view];
//        [_slideDelegate slideController:self stopScrollAndShowViewController:pageVC atIndex:currentPage];
    }else{
        UIViewController *childVC = self.childViewControllers[currentPage];
        childVC.view.frame = CGRectMake(currentPage * ScreenWidth, 0, ScreenWidth, _contentScroll.bounds.size.height);
        [_contentScroll addSubview:childVC.view];
        [_slideDelegate slideController:self stopScrollAndShowViewController:childVC atIndex:currentPage];
        //pwj___往下
        _contentScroll.contentOffset = CGPointMake(currentPage * ScreenWidth,0);
    }
    
}

- (void)setSlideDataSource:(id<FTSlideControllerDataSource>)slideDataSource
{
    _slideDataSource = slideDataSource;
    [self loadSlidePages];
    [array_title setArray:[_slideDataSource ViewControllerData:self]];
    [self cretaAsactiveLabel:array_title];

}

- (void)loadSlidePages
{
    
    if([self.slideDataSource respondsToSelector:@selector(numberOfSlideChildViewController:)]){
        _totalPages = [_slideDataSource numberOfSlideChildViewController:self];
    }
    _contentScroll.contentSize = CGSizeMake(_totalPages * ScreenWidth, _contentScroll.bounds.size.height);
    MyLog(@"_____%f",ScreenWidth);
    NSInteger index = 0;
    for (index = 0; index < _totalPages; index++) {
        UIViewController *pageVC = [_slideDataSource slideController:self viewControllerAtIndex:index];
        [self addChildViewController:pageVC];
        if (index == 0) {
            [_contentScroll addSubview:pageVC.view];
            pageVC.view.frame = CGRectMake(0, 0, ScreenWidth, _contentScroll.bounds.size.height);
        }
    }
}

- (UIViewController *)fetchControllerByIndex:(NSInteger)index
{
    return self.childViewControllers[index];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _contentScroll) {
        if ([_slideDelegate respondsToSelector:@selector(slideController:stopScrollAndShowViewController:atIndex:)]) {
            NSInteger currentPage = (NSInteger)_contentScroll.contentOffset.x / ScreenWidth;
            UIViewController *childVC = self.childViewControllers[currentPage];
            [_contentScroll addSubview:childVC.view];
            childVC.view.frame = CGRectMake(currentPage * ScreenWidth, 0, ScreenWidth, _contentScroll.bounds.size.height);
            [_slideDelegate slideController:self stopScrollAndShowViewController:childVC atIndex:currentPage];
            [self changeButtonColor:currentPage+1000];
        }
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
   

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

    
}


@end
