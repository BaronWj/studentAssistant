//
//  AddressBookViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/12.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "AddressBookViewController.h"
#import "UITableView+tableViewExtraCellHidden.h"
#import "DataSearchViewController.h"
#import "JSONKit.h"
#import "Bank.h"
#import "NewFriendViewController.h"
#import "ClassAddressViewController.h"
#import "EMSearchBar.h"
#define DocumentPaths  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)//Document文件路径
#define CacehFileName(_x) [[DocumentPaths objectAtIndex:0]stringByAppendingPathComponent:_x]
@interface AddressBookViewController ()<UISearchBarDelegate,DataSearchDelegate>

@end

@implementation AddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createShadow:NO];
    
    EMSearchBar *searchBar = [[EMSearchBar alloc] initWithFrame: CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 44.0f)];
    searchBar.placeholder = @"搜索";
    searchBar.delegate = self;

//    [searchBar searchBarUICustom];//seacrchBar样式
    
    
    self.address_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 160) style:UITableViewStylePlain];
    self.address_tableView.backgroundColor = backGround;
    [self.address_tableView setExtraCellLineHidden:YES];
    self.address_tableView.delegate = self;
    self.address_tableView.dataSource = self;
    self.address_tableView.tableHeaderView = searchBar;
    [self.view addSubview:self.address_tableView];
    self.address_tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.address_tableView.sectionIndexColor= labelTextColor;
    


}

#pragma mark --
#pragma mark -- searchBarDeletate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
//    [self becomeFirstResponder];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"banks" ofType:@"txt"];
    NSArray *banks = [NSArray arrayWithContentsOfFile:path];
    DataSearchViewController *search = [[DataSearchViewController alloc] initWithDataList:banks state:DataSearchStateBank delegate:self];
    search.titleString = @"搜索";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:search];
    [self presentViewController:nav animated:NO completion:^{}];

    return NO;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
//    [searchBar becomeFirstResponder];

};
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    MyLog(@"search");
    [self resignFirstResponder];

}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    self.address_tableView.contentOffset = CGPointMake(0, 44);
    
}

//-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
//shouldReloadTableForSearchString:(NSString *)searchString
//{
//    return YES;
//}

- (void)dataSearch:(DataSearchViewController *)controller didSelectWithObject:(id)aObject
         withState:(DataSearchState)state
{
    Bank *bank = [[Bank alloc] initWithDictionary:aObject];
    MyLog(@"名字%@-----编号:%@",bank.name,bank.code);
//    _searchField.text = bank.name;
//    _codeLabel.text = [NSString stringWithFormat:@"编号:%@",bank.code];
    [controller dismissViewControllerAnimated:NO completion:NULL];
}

- (void)dataSearchDidCanceled:(DataSearchViewController *)controller
                    withState:(DataSearchState)state
{
    [controller dismissViewControllerAnimated:NO completion:NULL];
}



#pragma mark --
#pragma mark -- tableViewDelegate && tableViewDateSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 2;
    }else{
        return 5;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return  35;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 32)];
    customView.backgroundColor = UIColorFromRGB(0xefeff4);
    UILabel * taglabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, ScreenWidth, 32)];
    [customView addSubview:taglabel];
    taglabel.backgroundColor = [UIColor clearColor];
    taglabel.textColor = labelTextColor;
    if (section == 0) {
        taglabel.text = @"A";
    }else if(section == 1){
        taglabel.text = @"B";

    }
    
    taglabel.font = [UIFont boldSystemFontOfSize:18];
    return customView;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
        AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
// cell = [[[NSBundle mainBundle] loadNibNamed:@"educationTeachingCell" owner:nil options:nil] lastObject];
    if (!cell) {
//              cell = [[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AddressTableViewCell" owner:nil options:nil] lastObject];
    }
    
//    NSArray * array = @[@"1"];
//    cell.data_array =array;
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.headImage.image = [UIImage imageNamed:@"addFriend"];
        cell.nameLabel.text = @"新的朋友";
        cell.videoButton.hidden = YES;
        cell.phoneButton.hidden = YES;
        cell.messButton.hidden = YES;
        badgeView = [[UIBadgeView alloc] initWithFrame:CGRectMake(170, 20, 50, 50)];
        badgeView.badgeString = @"20";
        badgeView.badgeColor = UIColorFromRGB(0xf7bc08);
        [cell addSubview:badgeView];
    }else if (indexPath.section == 0 && indexPath.row ==1){
        cell.headImage.image = [UIImage imageNamed:@"classAddress"];
        cell.nameLabel.text = @"班级通讯录";
        cell.videoButton.hidden = YES;
        cell.phoneButton.hidden = YES;
        cell.messButton.hidden = YES;

    }
    
    return cell;
}


-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray * musArray = [[NSMutableArray alloc]initWithCapacity:0];
    NSArray * array = @[@"A",@"B",@"C",@"D",@"E",@"F",@"H",@"I",@"G",@"#"];
    [musArray addObject:@"{search}"];
    [musArray addObjectsFromArray:array];
    return musArray;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0 && indexPath.section == 0){
        NewFriendViewController * newFriend = [[NewFriendViewController alloc]init];
        newFriend.title = @"新朋友";
        [newFriend setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:newFriend animated:YES];
    }else if (indexPath.row ==1 && indexPath.section == 0){
        ClassAddressViewController * classAddress = [[ClassAddressViewController alloc]init];
        classAddress.title = @"班级通讯录";
        [classAddress setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:classAddress animated:YES];
    
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
