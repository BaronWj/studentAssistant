//
//  ASActiveDynamicViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//  新闻


#define UISCREENHEIGHT  self.view.bounds.size.height
#define UISCREENWIDTH  self.view.bounds.size.width

#import "AsActiveCell.h"
#import "EScrollerView.h"
#import "ASActiveDynamicViewController.h"
#import "MJRefresh.h"
#import "ASActiveDetailsViewController.h"
//#import "UITableView+tableViewRefresh.h"
//NSString *const MJTableViewCellIdentifier = @"Cell";
 NSString * const  CellIdentifier = @"Cell";

/**
 *  随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface ASActiveDynamicViewController ()<EScrollerViewDelegate>{
    EScrollerView * scroller;
    CGRect  ESCroller_rect;

}
/**
 *  存放假数据
 */
@property (strong, nonatomic) NSMutableArray *fakeData;

@property (strong, nonatomic) NSArray * asActiveModelArray;
@property (strong, nonatomic) NSArray * focusModelArray;

@property (strong, nonatomic) MJRefreshHeaderView * head;
@property (strong, nonatomic) MJRefreshFooterView * footer;


@end

@implementation ASActiveDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self changeViewControllTitle:@"新闻"];
    [self createShadow:NO];
//    [self createFocusScroller];
    _asactive_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-88-40-30)];
    _asactive_tableView.delegate = self;
    _asactive_tableView.dataSource = self;
    _asactive_tableView.backgroundColor = [UIColor clearColor];
    [_asactive_tableView setExtraCellLineHidden:YES];
    [self.view addSubview:_asactive_tableView];
    
//    1. 添加头部控件的方法
    [self addRefreshViews];
    [self addfooterRefreshViews];
//    [SVProgressHUD showSuccessWithStatus:@"正在加载"];
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeGradient];

    
    [self requestNetData];
    [self requestNetListData];
}

//添加刷新控件
- (void)addRefreshViews
{
    __weak typeof(self) weakSelf = self;
    
    //load more
    int pageNum = 3;
    
    _head = [MJRefreshHeaderView header];
    _head.scrollView = self.asactive_tableView;
    _head.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        
//        [weakSelf.chatModel addRandomItemsToDataSource:pageNum];
//        if (weakSelf.chatModel.dataSource.count>pageNum) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:pageNum inSection:0];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.asactive_tableView reloadData];
//                [weakSelf.asactive_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
            });
//        }
        [weakSelf.head endRefreshing];
    };
}

//添加加载控件
- (void)addfooterRefreshViews
{
    __weak typeof(self) weakSelf = self;
    
    //load more
    int pageNum = 3;
    
    _footer = [MJRefreshFooterView footer];
    _footer.scrollView = self.asactive_tableView;
    _footer.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        //        [weakSelf.chatModel addRandomItemsToDataSource:pageNum];
        //        if (weakSelf.chatModel.dataSource.count>pageNum) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:pageNum inSection:0];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.asactive_tableView reloadData];
            //                [weakSelf.asactive_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
        });
        //        }
        [weakSelf.footer endRefreshing];
    };
}

//请求新闻列表数据
-(void)requestNetListData{
    asActivityViewModel * actityViewModel = [[asActivityViewModel alloc]init];
    NSDictionary * dict = @{
                            @"categoryId":@"1",
                            @"pageNo":@"1",
                            @"pageSize":@"5"
                            };
    [actityViewModel requestActivityViewModelData:dict];
    [actityViewModel setBlockWithReturnBlock:^(id returnValue){
        _asActiveModelArray = returnValue;
        [self.asactive_tableView reloadData];
        [SVProgressHUD dismiss];
        
        for (asActiveModel * labelModel in _asActiveModelArray) {
            MyLog(@"%@",labelModel.title_str);
        }
        
        MyLog(@"__newsInfo_newsInfo______%@",returnValue);
    } WithErrorBlock:^(id errorCode){
        [SVProgressHUD dismiss];
        
    }WithFailureBlock:^{
        [SVProgressHUD dismiss];
    }];
}



#pragma mark GetFocusNews
-(void)requestNetData{
    focusNewModel * focusNewViewModel = [[focusNewModel alloc]init];
    NSDictionary * dict = @{
                            @"SortId":@"89bb9ba6-10a2-e411-96c2-d850e6dd285f"
                            };
    [focusNewViewModel requestFocusNewsViewModelData:dict];
    [focusNewViewModel setBlockWithReturnBlock: ^(id returnValue){
        _focusModelArray = returnValue;
        [SVProgressHUD dismiss];
        NSMutableArray * titleArray = [[NSMutableArray alloc]initWithCapacity:0];
        NSMutableArray * imageUrl_Array = [[NSMutableArray alloc]initWithCapacity:0];

        for (asActiveModel * labelModel in _focusModelArray) {
            [titleArray addObject:labelModel.title_str];
            [imageUrl_Array addObject:labelModel.imageUrl_str];
              MyLog(@"__labelModel.imageUrl_str______%@",labelModel.imageUrl_str);
        }
        MyLog(@"__titleArray______%@",titleArray);
        MyLog(@"__imageUrl_Array______%@",imageUrl_Array);
        [self createFocusScroller:imageUrl_Array AndTitleName:titleArray];
        MyLog(@"__newsInfo_newsInfo______%@",returnValue);
    } WithErrorBlock:^(id errorCode){
        [SVProgressHUD dismiss];
        
    }WithFailureBlock:^{
        [SVProgressHUD dismiss];
        
    }];

}
#pragma mark - 构建广告滚动视图
-(void)createFocusScroller : (NSArray *)image_url AndTitleName:(NSArray *)title_array{
    ESCroller_rect = CGRectMake(0, 0, ScreenWidth, 170);
    scroller =[[EScrollerView alloc] initWithFrameRect:ESCroller_rect
                                            ImageArray:image_url
                                            TitleArray:title_array];
    
    scroller.delegate = self;
    _asactive_tableView.tableHeaderView =  scroller;
    [self.asactive_tableView reloadData];

}

-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    MyLog(@"aaa");
}
#pragma mark --
#pragma mark -- tableViewDelegate && tableViewSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [_asActiveModelArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
      AsActiveCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"AsActiveCell" owner:nil options:nil] lastObject];
    }
    cell.activeModel = _asActiveModelArray[indexPath.row];
     return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    asActivityViewModel * asactivity = [[asActivityViewModel alloc]init];
    [asactivity ActivityDetailWithPublicModel:_asActiveModelArray[indexPath.row] WithViewController:self];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)dealloc
//{
//    [_header free];
//    [_footer free];
//}



- (IBAction)aaa:(id)sender {
//    EducationalTeachingViewController * education = [[EducationalTeachingViewController alloc]init];
//    [self.navigationController pushViewController:education animated:YES];
    
}
@end
