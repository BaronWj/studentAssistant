//
//  CollectionViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/19.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionTableViewCell.h"
@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.\]
    
    _collection_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-60) style:UITableViewStylePlain];
    [_collection_tableView setExtraCellLineHidden:YES];
    _collection_tableView.delegate = self;
    _collection_tableView.dataSource = self;
    _collection_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collection_tableView];
    [self requestDate];
}

#pragma mark --
#pragma mark -- collection
-(void)requestDate{
        
//    MyLog(@"getAccountAndPassWord___%@",[StuSaveUserDefaults getAccountAndPassWord]);
//    NSDictionary * dict = @{};
//    [ASAPIClient getCollectionlistWithParameters:dict result:^(BOOL finish , NSDictionary * dict ,NSError * error){
//
//        MyLog(@"_______%@",dict);
//        MyLog(@"-------%d",finish);
//        MyLog(@"-------%@",error);
//
//    }];

}



#pragma mark--
#pragma mark--tableViewDelegate && tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 90;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString * tableIdentifier =@"cell";
    CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             tableIdentifier];
    if (cell == nil) {
//        cell = [[CollectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                       reuseIdentifier: tableIdentifier] ;
          cell = [[[NSBundle mainBundle] loadNibNamed:@"CollectionTableViewCell" owner:nil options:nil] lastObject];
    }
    cell.textLabel.text = @"11";
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
    
//        if (indexPath.row<[self.arrayOfRows count]) {
//            [self.arrayOfRows removeObjectAtIndex:indexPath.row];//移除数据源的数据
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
//        }
    }

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
