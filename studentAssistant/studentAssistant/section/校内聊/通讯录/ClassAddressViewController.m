//
//  ClassAddressViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/22.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "ClassAddressViewController.h"
#import "UITableView+tableViewExtraCellHidden.h"
#import "UISearchBar+ChatSearchBar.h"
#import "DataSearchViewController.h"
#import "JSONKit.h"
#import "Bank.h"
#import "ClassAddressTableViewCell.h"
#import "DropDownListView.h"
#define DocumentPaths  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)//Document文件路径
#define CacehFileName(_x) [[DocumentPaths objectAtIndex:0]stringByAppendingPathComponent:_x]
@interface ClassAddressViewController ()<UISearchBarDelegate,DataSearchDelegate,DropDownChooseDataSource,DropDownChooseDelegate>
{
    NSMutableArray * chooseArray;

}
@end

@implementation ClassAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
//    chooseArray = [NSMutableArray arrayWithArray:@[
//                                                   @[@"13级多艺101班",@"13级绘画101班",@"13级计算机101班",@"13级土木101班"],
//                                                   @[@"舞蹈与形体",@"艺术概论",@"计算机信息",@"土木工程"],
//                                                   ]];
//
//    
//    DropDownListView * dropDownView = [[DropDownListView alloc] initWithFrame:CGRectMake(0,5, ScreenWidth, 40) dataSource:self delegate:self];
//    dropDownView.backgroundColor = [UIColor clearColor];
//    dropDownView.mSuperView = self.view;
//    [self.view addSubview:dropDownView];
    

    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame: CGRectMake(0.0f, 0.0f, ScreenWidth, 40.0f)];
    searchBar.placeholder = @"搜索";
    searchBar.delegate = self;
    
    [searchBar searchBarUICustom];//seacrchBar样式
    [self.view addSubview:searchBar];
    
    self.address_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 55) style:UITableViewStylePlain];
    self.address_tableView.backgroundColor = [UIColor whiteColor];
    [self.address_tableView setExtraCellLineHidden:YES];
    self.address_tableView.delegate = self;
    self.address_tableView.dataSource = self;
    self.address_tableView.tableHeaderView = searchBar;
    [self.view addSubview:self.address_tableView];
    self.address_tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.address_tableView.sectionIndexColor= labelTextColor;

}

#pragma mark -- dropDownListDelegate
-(void) chooseAtSection:(NSInteger)section index:(NSInteger)index
{
    NSLog(@"选了section:%ld ,index:%ld",section,index);
}

#pragma mark -- dropdownList DataSource
-(NSInteger)numberOfSections
{
    return [chooseArray count];
}
-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSArray *arry =chooseArray[section];
    return [arry count];
}
-(NSString *)titleInSection:(NSInteger)section index:(NSInteger) index
{
    return chooseArray[section][index];
}
-(NSInteger)defaultShowSection:(NSInteger)section
{
    return 0;
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
        return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return  30;
 
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    customView.backgroundColor =  UIColorFromRGB(0xefeff4);
    UILabel * taglabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, ScreenWidth, 30)];
    [customView addSubview:taglabel];
    taglabel.backgroundColor = [UIColor clearColor];
    taglabel.textColor = labelTextColor;
    if (section == 0) {
        taglabel.text = @"班主任";
    }else if(section == 1){
        taglabel.text = @"辅导员";
        
    }else{
        taglabel.text = @"A";

    }
    
    taglabel.font = [UIFont boldSystemFontOfSize:18];
    return customView;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"Cell";
    ClassAddressTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // cell = [[[NSBundle mainBundle] loadNibNamed:@"educationTeachingCell" owner:nil options:nil] lastObject];
    if (!cell) {
        //              cell = [[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ClassAddressTableViewCell" owner:nil options:nil] lastObject];
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
