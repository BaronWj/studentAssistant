//
//  PeopleInfoViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//  我

#import "PeopleInfoViewController.h"
#import "peopleInfoCell.h"
#import "UIImageView+UIImageCategory.h"
#import "UITableView+tableViewExtraCellHidden.h"
@interface PeopleInfoViewController (){
    NSArray * titleArray ;
}

@end

@implementation PeopleInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.people_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.people_tableView.delegate = self;
    self.people_tableView.dataSource = self;
    self.people_tableView.backgroundColor = backGround;
    [self.view addSubview:self.people_tableView];
    [self.people_tableView setExtraCellLineHidden:YES];
    self.people_array = [[NSMutableArray alloc]initWithCapacity:0];
    titleArray = @[@"工号",@"手机",@"邮箱",@"性别",@"身份证号",@"履历"];
    
    [self requestNetWork];
    
}

-(void)requestNetWork{
    NSDictionary * dict = @{};
    [ASAPIClient getPeopleInfoParameters:dict result:^(BOOL sucess,NSDictionary * dict,NSError * error){
             
    
    }];

}

#pragma mark --
#pragma mark -- tableViewdelegate
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 10;
//}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 2;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 70;
    }
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
       peopleInfoCell * cell = (peopleInfoCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"peopleInfoCell" owner:nil options:nil] lastObject];
    }
    if(indexPath.row == 0){
        UIImageView * headImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 5, 55, 55)];
        headImage.image = [UIImage imageNamed:@"defaultStudentHead"];
//        [headImage setImageRoundedcorners:55/2];
        [cell addSubview:headImage];
        cell.titleLabel.hidden = YES;
        cell.titleValue.hidden = YES;
        
        UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 7, 100, 30)];
        nameLabel.text = @"公孙绿萼";
        nameLabel.font = [UIFont boldSystemFontOfSize:18];
        nameLabel.textColor = labelTextColor;
        [cell addSubview:nameLabel];
        
        
        UILabel * postLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 33, 100, 30)];
        postLabel.text = @"教师";
        postLabel.font = [UIFont boldSystemFontOfSize:16];
        postLabel.textColor = labelTextColor;
        [cell addSubview:postLabel];
        
    }
    cell.titleLabel.text = [titleArray objectAtIndex:indexPath.row];

//    cell.titleLabel.text =
//    cell.education_dict = [_education_array objectAtIndex:indexPath.row];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
