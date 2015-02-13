//
//  ElectiveInfoViewController.m
//  studentAssistant
//
//  Created by MyUpinup on 15/2/11.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "ElectiveInfoViewController.h"
#import "electiveInfoTableViewCell.h"
#import "TeacherInfoViewController.h"
@interface ElectiveInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ElectiveInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.electiveInfoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 60) style:UITableViewStylePlain];
    self.electiveInfoTableView.delegate = self;
    self.electiveInfoTableView.dataSource = self;
    self.electiveInfoTableView.backgroundColor = backGround;
    [self.view addSubview:self.electiveInfoTableView];
  
    self.electiveInfo_array = [[NSMutableArray alloc]initWithCapacity:0];
    [self.electiveInfo_array setArray:@[@"课程名称",@"授课老师",@"上课地点",@"上课时间",@"课时",@"课程类型",@"学分",@"开课时间",@"选报时间"]];
}
#pragma mark --
#pragma mark -- tableViewDelegate && tableViewDateSource
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 15;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _electiveInfo_array.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
   //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    electiveInfoTableViewCell * cell = (electiveInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //      cell = [[educationTeachingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"electiveInfoTableViewCell" owner:nil options:nil] lastObject];
    }
    
    //    cell.education_dict = [_education_array objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TeacherInfoViewController * teacherInfo = [[TeacherInfoViewController alloc]init];
    teacherInfo.title = @"教师详情";
    teacherInfo.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:teacherInfo animated:YES];

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
