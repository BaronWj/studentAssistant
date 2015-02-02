//
//  CourseInfoViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/22.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "CourseInfoViewController.h"
#import "CourseInfoTableViewCell.h"
#import "UITableView+tableViewExtraCellHidden.h"
@interface CourseInfoViewController ()

@end

@implementation CourseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.courseTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 3, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.courseTableView.delegate = self;
    self.courseTableView.dataSource = self;
    self.courseTableView.backgroundColor = backGround;
    [self.courseTableView setExtraCellLineHidden:YES];
    [self.view addSubview:self.courseTableView];
}
#pragma mark --
#pragma mark -- tableViewDelegate && tableViewDateSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   CourseInfoTableViewCell * cell = (CourseInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        //      cell = [[educationTeachingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CourseInfoTableViewCell" owner:nil options:nil] lastObject];
    }
    
//    cell.education_dict = [_education_array objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
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
