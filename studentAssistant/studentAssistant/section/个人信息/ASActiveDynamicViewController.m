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
@property (strong, nonatomic) NSMutableArray * activeNewData_array;

@property (strong, nonatomic) NSArray * asActiveModelArray;
@property (strong, nonatomic) NSArray * focusModelArray;

@property (strong, nonatomic) MJRefreshHeaderView * head;
@property (strong, nonatomic) MJRefreshFooterView * footer;
@property (assign, nonatomic) NSInteger pageNum ;

@end

@implementation ASActiveDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageNum = 1;
    self.activeNewData_array = [[NSMutableArray alloc]initWithCapacity:0];
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

    //注册一个observer来响应消息的传送
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)//接收消息方法
                                                 name:@"FirstCategory"//消息识别名称
                                               object:nil];
    

}

-(void)receiveNotification:(NSNotification *) not{
    [self requestFocusNetData:[[not object] firstObject]];
    [self requestNetListData:[[not object] firstObject]AndPageNo:@"1"];
//    [self.head beginRefreshing];
    _sortID =[[not object] firstObject];
    self.pageNum ++;
}
//添加刷新控件
- (void)addRefreshViews
{
    __weak typeof(self) weakSelf = self;
    //load more
    _head = [MJRefreshHeaderView header];
    _head.scrollView = self.asactive_tableView;
    _head.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        [weakSelf.activeNewData_array removeAllObjects];
        [weakSelf.asactive_tableView reloadData];

        [weakSelf requestFocusNetData:weakSelf.sortID];
        [weakSelf requestNetListData:weakSelf.sortID AndPageNo:@"1"];
        [weakSelf.head endRefreshing];
    };
}

//添加加载控件
- (void)addfooterRefreshViews
{
    __weak typeof(self) weakSelf = self;
    //load more
    _footer = [MJRefreshFooterView footer];
    _footer.scrollView = self.asactive_tableView;
    _footer.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        [weakSelf requestNetListData:weakSelf.sortID AndPageNo:[NSString stringWithFormat:@"%ld",(long)weakSelf.pageNum]] ;
        [weakSelf.footer endRefreshing];
        weakSelf.pageNum ++;
    };
}

-(void)setSortID:(NSString *)sortID{
//    [self.head beginRefreshing];
    [self requestFocusNetData:sortID];
    [self requestNetListData:sortID AndPageNo:@"1"];
    
    
}

//请求新闻列表数据
-(void)requestNetListData:(NSString *)sortID AndPageNo:(NSString *)pageNo{
    asActivityViewModel * actityViewModel = [[asActivityViewModel alloc]init];
    NSDictionary * dict = @{
                            @"sortId":sortID,
                            @"pageNo":pageNo,
                            @"pageSize":@"5"
                            };
    [actityViewModel requestActivityViewModelData:dict];
    [actityViewModel setBlockWithReturnBlock:^(id returnValue){
        _asActiveModelArray = returnValue;
        [self.activeNewData_array addObjectsFromArray:_asActiveModelArray];
//        [self.head endRefreshing];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_asactive_tableView reloadData];
        });

        [SVProgressHUD dismiss];
    } WithErrorBlock:^(id errorCode){
        [SVProgressHUD dismiss];
        
    }WithFailureBlock:^{
        [SVProgressHUD dismiss];
    }];
}



#pragma mark GetFocusNews
-(void)requestFocusNetData:(NSString *)sortID{
    focusNewModel * focusNewViewModel = [[focusNewModel alloc]init];
    NSDictionary * dict = @{
                            @"sortId":sortID
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
        }
        [self createFocusScroller:imageUrl_Array AndTitleName:titleArray];
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

}

-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    focusNewModel * asactivity = [[focusNewModel alloc]init];
    [asactivity FocusNewsDetailWithPublicModel:_focusModelArray[index-1] WithViewController:self];
}
#pragma mark --
#pragma mark -- tableViewDelegate && tableViewSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.activeNewData_array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
      AsActiveCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"AsActiveCell" owner:nil options:nil] lastObject];
    }
    cell.activeModel = self.activeNewData_array[indexPath.row];
     return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    asActivityViewModel * asactivity = [[asActivityViewModel alloc]init];
    [asactivity ActivityDetailWithPublicModel:self.activeNewData_array[indexPath.row] WithViewController:self];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"FirstCategory" object:nil];


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
