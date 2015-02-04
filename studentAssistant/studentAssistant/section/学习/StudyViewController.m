//
//  StudyViewController.m
//  studentAssistant
//
//  Created by MyUpinup on 15/2/2.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "StudyViewController.h"
#import "CurriculumTableViewController.h"
#import "AttendanceViewController.h"
#import "ElectiveViewController.h"
#import "EvaluateViewController.h"
@interface StudyViewController ()

@end

@implementation StudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self changeViewControllTitle:@"教学教务"];
    //    self.navTitle = @"教学教务";
    _educational_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-90-30) style:UITableViewStylePlain];
    [_educational_tableView setExtraCellLineHidden:YES];
    _educational_tableView.delegate = self;
    _educational_tableView.dataSource = self;
    _educational_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_educational_tableView];
    
//    UIImage * image =[[UIImage alloc]init];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh"] style:UIBarButtonItemStyleDone target:self action:@selector(refresh)];
    UIButton * refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshButton setImage:[UIImage imageNamed:@"refresh"] forState:UIControlStateNormal];
    refreshButton.frame = CGRectMake(0, 0, 30, 30);
//    [_backButton setBackgroundImage:[UIImage imageNamed:nil] forState:UIControlStateHighlighted];
    [refreshButton addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];
    self.navigationItem.rightBarButtonItem = buttonItem;

    
    _education_array = @[@{@"name":@"课程表",@"msg":@"本学期3门课 剩余课时50/300",@"headImage_url":@"classTable"},@{@"name":@"考勤",@"msg":@"目前三门课异常",@"headImage_url":@"attendance"},@{@"name":@"选修课",@"msg":@"已选课程4门 已退课程1门",@"headImage_url":@"elective"},@{@"name":@"评价",@"msg":@"待评价 3 评价结果 2",@"headImage_url":@"evaluation"},@{@"name":@"成绩",@"msg":@"最新成绩一门 班级最高分 150分",@"headImage_url":@"results"},@{@"name":@"考试安排",@"msg":@"最近考试:高数 日期： 2014-03-02 ",@"headImage_url":@"exam"}];
}

-(void)refresh{
    MyLog(@"refresh");

    
}
#pragma mark --
#pragma mark -- tableViewdelegate
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 10;
//}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 9;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 65;
    }
    return 65;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _education_array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    educationTeachingCell * cell = (educationTeachingCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        //      cell = [[educationTeachingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"educationTeachingCell" owner:nil options:nil] lastObject];
    }
    
    cell.education_dict = [_education_array objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
//{
//    cell.backgroundColor = UIColorFromRGB(0x21555c);
//    cell.textLabel.backgroundColor = [UIColor clearColor];
//    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        CurriculumTableViewController * curriculum = [[CurriculumTableViewController alloc]init];
        //        curriculum.title = @"";
        [curriculum setHidesBottomBarWhenPushed:YES];
        
        [self.navigationController pushViewController:curriculum animated:YES];
//        CallNameViewController * callName = [[CallNameViewController alloc]init];
//        [callName setHidesBottomBarWhenPushed:YES];
//        //        callName.isBackButton = YES;
//        [callName changeViewControllTitle:@"点名"];
//
//        [self.navigationController pushViewController:callName animated:YES];
    }else if (indexPath.row == 1) {
        AttendanceViewController * attendAnceView = [[AttendanceViewController alloc]init];
        attendAnceView.title = @"考勤";
        [attendAnceView setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:attendAnceView animated:YES];
    }else if (indexPath.row == 3){
        EvaluateViewController * evaluate = [[EvaluateViewController alloc]init];
        evaluate.title = @"评价教师";
        
        [evaluate setHidesBottomBarWhenPushed:YES];
        //        attendance.isBackButton = YES;
        [self.navigationController pushViewController:evaluate animated:YES];
        
    }else if (indexPath.row == 2){
        ElectiveViewController * elective = [[ElectiveViewController alloc]init];
        elective.title = @"选课退课";
        [elective setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:elective animated:YES];
//
        
    }
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
