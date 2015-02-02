//
//  ChooseShcoolViewController.m
//  StudentAssistant
//
//  Created by 迈艾普 on 14-2-26.
//  Copyright (c) 2014年 Baron. All rights reserved.
//

#import "ChooseShcoolViewController.h"

@interface ChooseShcoolViewController ()
{
    NSMutableArray * _schoolIpAddress;
    NSMutableArray * school_array;
}
@end

@implementation ChooseShcoolViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _chooseSchool_tableView.backgroundColor = [UIColor clearColor];
    _chooseSchool_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    if(IsAfterIOS7){
//        _chooseSchool_tableView.sectionIndexBackgroundColor = UIColorFromRGB(0x073d43);
//    }else{
//        _chooseSchool_tableView.sectionIndexColor = UIColorFromRGB(0x073d43);
//    }
    _chooseSchool_tableView.sectionIndexColor = [UIColor blackColor];
    UIButton * right_button = [UIButton buttonWithType:UIButtonTypeCustom];
    right_button.frame = CGRectMake(0, 0, 60, 44);
    [right_button setTitle:@"取消" forState:UIControlStateNormal];
    [right_button.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:right_button];
    self.navigationItem.rightBarButtonItem =rightBarButton;
    [right_button addTarget:self action:@selector(CancelWay) forControlEvents:UIControlEventTouchUpInside];
    
    _chooseSchool_tableView.delegate = self;
    _chooseSchool_tableView.dataSource = self;
    projectTitle_array = [[NSMutableArray alloc]initWithCapacity:0];
    _schoollist = [[NSMutableArray alloc]initWithCapacity:0];
    searchHead_array = [[NSMutableArray alloc]initWithCapacity:0];
    _schoolIcon_array = [[NSMutableArray alloc]initWithCapacity:0];
    _schoolIpAddress = [[NSMutableArray alloc]initWithCapacity:0];
    
     school_array = [[NSMutableArray alloc]init];
    [self addModel];
}

-(void)CancelWay{
    [self dismissViewControllerAnimated:YES completion:^{}];

}
-(void)addModel{
    NSArray * array = [[NSArray alloc]initWithObjects:@"清华大学",@"北京大学",@"北京大学医学部",@"人民大学",@"体育大学",@"邮电大学",@"化工大学",@"土木工程学园", nil];
    NSMutableArray * project_array = [[NSMutableArray alloc]initWithCapacity:0];
    [project_array setArray:array];
    projectTitle_array =  [tableviewIndexSearch getChineseStringArr:project_array withSectionHeadsKeys:
                           searchHead_array];
    [_chooseSchool_tableView reloadData];
    
}
#pragma mark --
#pragma mark -- tableViewdelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [searchHead_array count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[projectTitle_array objectAtIndex:section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell  = [[[NSBundle mainBundle] loadNibNamed:@"chooseSchoolCell" owner:self options:nil]lastObject];
    }
    UIImageView * imageView_Line = [[UIImageView alloc]initWithFrame:CGRectMake(9,49.5 , 311, 0.5)];
    imageView_Line.backgroundColor = UIColorFromRGB(0xdddcdc);
    [cell addSubview:imageView_Line];
    if ([projectTitle_array count] > indexPath.section) {
        NSArray *arr = [projectTitle_array objectAtIndex:indexPath.section];
        if ([arr count] > indexPath.row) {
            ChineseString *chineseStr = (ChineseString*)[arr objectAtIndex:indexPath.row];
            _chooseSchool_Label.text = chineseStr.string;
            
            [self searchSever:chineseStr.string];
         NSString * icon_url =[self searchData:chineseStr.string];
           if (!ISNULLSTR(icon_url)) {
              [_SchoolICon setImageWithURL:[NSURL URLWithString:icon_url]placeholderImage:[UIImage imageNamed:@"defaultHead"]];
           }else{
              [_SchoolICon setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"defaultHead"]];
           }
        }
    }
//    cell.selectedBackgroundView =[[UIView alloc]initWithFrame:cell.frame];
//    cell.selectedBackgroundView.backgroundColor = UIColorFromRGB(0x073d43);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString * selectCity;
    if ([projectTitle_array count] > indexPath.section) {
        NSArray *arr = [projectTitle_array objectAtIndex:indexPath.section];
        if ([arr count] > indexPath.row) {
            ChineseString *chineseStr = (ChineseString*)[arr objectAtIndex:indexPath.row];
            selectCity = chineseStr.string;
        }
    }
    NSString * schoole_url =[self searchSever:selectCity];
    [[NSUserDefaults standardUserDefaults] setObject:schoole_url forKey:@"schoolIp_url"];
    [self.changeSchoolDelegate changeValue:selectCity];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{}];
}



-(NSString * )searchData:(NSString *)Name_STR{
    NSString * Img_URL ;
    for (int k = 0; k<[school_array count]; k++) {
        if ([Name_STR isEqualToString:[[school_array objectAtIndex:k] valueForKey:@"SchoolName"]]) {
            Img_URL = [[school_array objectAtIndex:k] valueForKey:@"Img"];
        }
    }
    return Img_URL;
}

-(NSString * )searchSever:(NSString *)Name_STR{
    NSString * ServerUrl ;
    for (int k = 0; k<[school_array count]; k++) {
        if ([Name_STR isEqualToString:[[school_array objectAtIndex:k] valueForKey:@"SchoolName"]]) {
            ServerUrl = [[school_array objectAtIndex:k] valueForKey:@"ServerUrl"];
        }
    }
    return ServerUrl;
}


//- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    
//    return [searchHead_array objectAtIndex:section];
//    
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    UIView* myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 90, 22)];
    titleLabel.textColor=[UIColor blackColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text=[searchHead_array objectAtIndex:section];
    [myView addSubview:titleLabel];
    UIImageView * upimageView_Line = [[UIImageView alloc]initWithFrame:CGRectMake(9,21.5 , 311, 0.5)];
    upimageView_Line.backgroundColor = UIColorFromRGB(0xdddcdc);
    [myView addSubview:upimageView_Line];

    return myView;
}



- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return searchHead_array ;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
//    [self requestSchoollist];

}
//-(void)requestSchoollist{
//    NSDictionary * dict = @{};
//    [[RequestCenter sharedRequestCenter] requestNet1:dict setUrl:@"/GetSchoolList" SetSuccessBlock:^(NSDictionary * data_dict){
////       NSLog(@"school_%@",data_dict);
//       
//        if ([[data_dict valueForKey:@"Data"] count] != 0) {
//            [_schoollist removeAllObjects];
//            [school_array setArray:[data_dict valueForKey:@"Data"]];
//            for (int i = 0; i < [[data_dict valueForKey:@"Data"] count]; i ++ ) {
//                [_schoollist addObject:[[[data_dict objectForKey:@"Data"] objectAtIndex:i]objectForKey:@"SchoolName"]];
////                [_schoolIcon_array addObject:[[[data_dict objectForKey:@"Data"] objectAtIndex:i]objectForKey:@"Img"]];
////                [_schoolIpAddress addObject:[[[data_dict objectForKey:@"Data"] objectAtIndex:i]objectForKey:@"ServerUrl"]];
//            }
//            projectTitle_array =  [tableviewIndexSearch getChineseStringArr:_schoollist withSectionHeadsKeys:
//                                   searchHead_array];
//        }
//        [_chooseSchool_tableView reloadData];
//        
//        
//    } setFaileBlock:^(NSDictionary * data_dict){
////        NSLog(@"school_%@",data_dict);
//    
//    }];
//
//
//}
- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
{
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
