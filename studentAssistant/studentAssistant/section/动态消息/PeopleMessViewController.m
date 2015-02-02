//
//  PeopleMessViewController.m
//  studentAssistant
//
//  Created by MyUpinup on 15/2/2.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "PeopleMessViewController.h"
#import "UITableView+tableViewExtraCellHidden.h"
#import "ModifyPwdViewController.h"
#import "softwareViewController.h"
#import "opinionViewController.h"
#import "RecommendedViewController.h"
#import "LoginViewController.h"
#import "UITableViewCell+tableViewCell.h"
@interface PeopleMessViewController ()

@end

@implementation PeopleMessViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [self changeViewControllTitle:@"我"];
    _peopleMess_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-90) style:UITableViewStyleGrouped];
    _peopleMess_tableView.delegate = self;
    _peopleMess_tableView.dataSource = self;
    [_peopleMess_tableView setExtraCellLineHidden:YES];
    _peopleMess_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_peopleMess_tableView];
    _peopleMess_Array = @[@[@"我的信息"],@[@"修改密码",@"软件更新",@"应用推荐"],@[@"意见反馈",@"退出当前账号"]];
    _peopleMessImage = @[@[@"me01"],@[@"updatePassWord",@"soaft",@"recommed"],@[@"opinion",@"equitAccount"]];
}

#pragma mark --
#pragma mark -- tableViewdelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_peopleMess_Array count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row==0) {
        return 50;
    }
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_peopleMess_Array objectAtIndex:section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    [cell tableViewCellBackbround];
    cell.imageView.image = [UIImage imageNamed:[[_peopleMessImage objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    cell.textLabel.text = [[_peopleMess_Array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.textColor = labelTextColor;
 
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0 && indexPath.section == 0){
        peopleInfoViewModel * peopleInfo = [[peopleInfoViewModel alloc]init];
        [peopleInfo ActivityDetailWithPublicModel:nil WithViewController:self];
    }else if (indexPath.row == 0  && indexPath.section == 1){
        ModifyPwdViewController * modifyPwd = [[ModifyPwdViewController alloc]init];
        modifyPwd.title = @"修改密码";
        [modifyPwd setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:modifyPwd animated:YES];
    }else if (indexPath.row == 1 && indexPath.section == 1){
        softwareViewController * softWare = [[softwareViewController alloc]init];
        softWare.title = @"软件更新";
        softWare.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:softWare animated:YES];
        
    }else if (indexPath.row == 2 && indexPath.section == 1){
        RecommendedViewController * recommendend = [[RecommendedViewController alloc]init];
        recommendend.title = @"应用推荐";
        recommendend.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:recommendend animated:YES];
        
    }else if (indexPath.row == 0 && indexPath.section == 2){
        opinionViewController * opinion = [[opinionViewController alloc]init];
        opinion.title = @"意见反馈";
        opinion.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:opinion animated:YES];
        
    }else if (indexPath.row == 1 && indexPath.section == 2){
        [StuSaveUserDefaults saveFirstLogin:NO];
        LoginViewController * login = [[LoginViewController alloc]init];
        login.title = @"登录";
        login.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:login animated:YES];
        
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
