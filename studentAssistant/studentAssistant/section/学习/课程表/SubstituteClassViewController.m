//
//  SubstituteClassViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/28.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "SubstituteClassViewController.h"
#import "SubstituteTableViewCell.h"

@interface SubstituteClassViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SubstituteClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.substituteClass = [[UITableView alloc]initWithFrame:CGRectMake(0, 5, ScreenWidth, ScreenHeight - 60) style:UITableViewStylePlain];
    self.substituteClass.delegate = self;
    self.substituteClass.dataSource = self;
    self.substituteClass.backgroundColor = backGround;
    [self.view addSubview:self.substituteClass];
}


#pragma mark --
#pragma mark -- tableViewDelegate && tableViewDateSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 16 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    //        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    SubstituteTableViewCell * cell = (SubstituteTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        //      cell = [[educationTeachingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SubstituteTableViewCell" owner:nil options:nil] lastObject];
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
