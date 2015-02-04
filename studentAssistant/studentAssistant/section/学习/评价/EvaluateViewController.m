//
//  EvaluateViewController.m
//  studentAssistant
//
//  Created by MyUpinup on 15/2/3.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "EvaluateViewController.h"
#import "evaluateTableViewCell.h"
@interface EvaluateViewController ()

@end

@implementation EvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.evaluate_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 60) style:UITableViewStylePlain];
    self.evaluate_tableView.delegate = self;
    self.evaluate_tableView.dataSource = self;
    self.evaluate_tableView.backgroundColor = backGround;
    [self.view addSubview:self.evaluate_tableView];
//    [self.evaluate_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //    if ([self.electiveClass respondsToSelector:@selector(setSeparatorInset:)]) {
    //        [self.electiveClass setSeparatorInset:UIEdgeInsetsZero];
    //    }

}

#pragma mark --
#pragma mark -- tableViewDelegate && tableViewDateSource
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 15;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 55;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 16 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    //        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    evaluateTableViewCell * cell = (evaluateTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //      cell = [[educationTeachingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"evaluateTableViewCell" owner:nil options:nil] lastObject];
    }
    
    //    cell.education_dict = [_education_array objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
