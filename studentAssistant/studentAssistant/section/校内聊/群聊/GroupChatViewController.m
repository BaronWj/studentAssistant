//
//  GroupChatViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/20.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "GroupChatViewController.h"
#import "EMSearchDisplayController.h"
#import "EMSearchBar.h"
#import "DataSearchViewController.h"
#import "Bank.h"
#define DocumentPaths  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)//Document文件路径
#define CacehFileName(_x) [[DocumentPaths objectAtIndex:0]stringByAppendingPathComponent:_x]
@interface GroupChatViewController ()<UISearchDisplayDelegate,UISearchBarDelegate,DataSearchDelegate>
@property (strong, nonatomic) EMSearchBar *searchBar;
@property (strong, nonatomic) EMSearchDisplayController *searchController;
@end

@implementation GroupChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createShadow:NO];
    self.groupChat_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-160) style:UITableViewStylePlain];
    self.groupChat_tableView.backgroundColor = [UIColor clearColor];
    self.groupChat_tableView.delegate = self;
    self.groupChat_tableView.dataSource = self;
    self.groupChat_tableView.tableHeaderView = self.searchBar;

    [self searchController];
    [self.view addSubview:self.groupChat_tableView];
 }


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // cell = [[[NSBundle mainBundle] loadNibNamed:@"educationTeachingCell" owner:nil options:nil] lastObject];
    if (!cell) {
        //              cell = [[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GroupChatTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UISearchBar *)searchBar
{
    if (_searchBar == nil) {
        _searchBar = [[EMSearchBar alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = NSLocalizedString(@"搜索", @"Search");
        _searchBar.backgroundColor = [UIColor colorWithRed:0.747 green:0.756 blue:0.751 alpha:1.000];
    }
    
    return _searchBar;
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
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    self.groupChat_tableView.contentOffset = CGPointMake(0, 44);

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



#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
//    [[RealtimeSearchUtil currentUtil] realtimeSearchStop];
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
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
