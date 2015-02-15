//
//  CollectionViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionTableViewCell.h"
#import "collectionModelView.h"
@interface CollectionViewController ()
@property (strong, nonatomic) MJRefreshHeaderView * head;
@property (strong, nonatomic) MJRefreshFooterView * footer;
@property (assign, nonatomic) NSInteger pageNum ;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.\]

    //    1. 添加头部控件的方法
    _collection_array = [[NSMutableArray alloc]initWithCapacity:0];
    _collection_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-60) style:UITableViewStylePlain];
    [_collection_tableView setExtraCellLineHidden:YES];
    _collection_tableView.delegate = self;
    _collection_tableView.dataSource = self;
    _collection_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collection_tableView];
    
    [self addRefreshViews];
    [self addfooterRefreshViews];
//    [self requestDate];

    
}


//添加刷新控件
- (void)addRefreshViews
{
    _pageNum = 1;
    __weak typeof(self) weakSelf = self;
    //load more
    _head = [MJRefreshHeaderView header];
    [_head beginRefreshing];
    _head.scrollView = self.collection_tableView;
    _head.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
        [weakSelf requestNetListData:@"1" AndPageNo:@"1" AndRefreshState:@"refesh"];
    };
//    [weakSelf.head endRefreshing];
}

//添加加载控件
- (void)addfooterRefreshViews
{
    _pageNum = 2;
    __weak typeof(self) weakSelf = self;
    //load more
    _footer = [MJRefreshFooterView footer];
    _footer.scrollView = self.collection_tableView;
    _footer.beginRefreshingBlock = ^(MJRefreshBaseView *refreshView) {
            [weakSelf requestNetListData:@"1" AndPageNo:[NSString stringWithFormat:@"%ld",(long)weakSelf.pageNum] AndRefreshState:@"Add"] ;
             weakSelf.pageNum ++;
    };
    [weakSelf.footer endRefreshing];
}


#pragma mark --
#pragma mark -- collection
-(void)requestNetListData:(NSString *)isCollection AndPageNo:(NSString *)pageNo AndRefreshState:(NSString *)refreshState{
    [SVProgressHUD showWithStatus:@"正在加载" maskType:SVProgressHUDMaskTypeGradient];
    collectionModelView * collectionViewModel = [[collectionModelView alloc]init];
    NSDictionary * dict = @{
                            @"isCollection":isCollection,
                            @"pageNo":pageNo,
                            @"pageSize":@"5",
                           };
    [collectionViewModel requestCollectionViewModelData:dict];
    [collectionViewModel setBlockWithReturnBlock:^(id returnValue){
        if ([refreshState isEqualToString:@"refesh"])
        {
            [self.collection_array removeAllObjects];
            [self.collection_array setArray:(NSArray *)returnValue];
            [_head endRefreshing];
            [self.collection_tableView reloadData];
        }else{
            [self.collection_array addObjectsFromArray:(NSArray *)returnValue];
            [_footer endRefreshing];
        }

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.collection_tableView reloadData];
        });

        [SVProgressHUD dismiss];
     } WithErrorBlock:^(id errorCode){
        [SVProgressHUD dismiss];
        
    }WithFailureBlock:^{
        [SVProgressHUD dismiss];
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [_head free];
    [_footer free];
}

#pragma mark--
#pragma mark--tableViewDelegate && tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.collection_array.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString * tableIdentifier =@"cell";
    CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             tableIdentifier];
    if (cell == nil) {
          cell = [[[NSBundle mainBundle] loadNibNamed:@"CollectionTableViewCell" owner:nil options:nil] lastObject];
    }
    if(!ISNULLARRAY(self.collection_array)){
        cell.activeModel = self.collection_array[indexPath.row];
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    collectionModelView * collection = [[collectionModelView alloc]init];
    [collection CollectionNewsDetailWithPublicModel:self.collection_array[indexPath.row] WithViewController:self];

}



-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
       collectionModelView * collectionViewModel = [[collectionModelView alloc]init];
        [collectionViewModel DeleteDetailWithPublicModel:self.collection_array[indexPath.row]];
        [self.collection_array removeObjectAtIndex:indexPath.row];//移除数据源的数据
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
        [collectionViewModel setBlockWithReturnBlock:^(NSDictionary * returnValue){
            MyLog(@"__%@",returnValue);
                [self showToast:@"删除成功"];                
        } WithErrorBlock:^(id errorCode){

        }WithFailureBlock:^{
        
        }];
    }
}


- (void)dealloc
{
    
}



//- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
//{
//    cell.backgroundColor = UIColorFromRGB(0x21555c);
//    cell.textLabel.backgroundColor = [UIColor clearColor];
//    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
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
