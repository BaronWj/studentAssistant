//
//  RecommendedViewController.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/29.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "RecommendedViewController.h"
#import "RecomCollectionViewCell.h"
static NSString * const reuseIdentifier = @"Cell";

@interface RecommendedViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation RecommendedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    
    custom_collectionView  = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    custom_collectionView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    custom_collectionView.delegate = self;
    custom_collectionView.dataSource = self;
    [self.view addSubview:custom_collectionView];
    custom_collectionView.backgroundColor = [UIColor clearColor];
    //        custom_collectionView.backgroundColor = [UIColor colorWithRed:0.895 green:1.000 blue:0.656 alpha:1.000];
    UINib *nib = [UINib nibWithNibName:@"RecomCollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [custom_collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark
#pragma mark <UICollectionViewDataSource>
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Register nib file for the cell
    RecomCollectionViewCell *cell = [[RecomCollectionViewCell alloc]init];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                     forIndexPath:indexPath];
//    [cell setCurMediaItem: [_iteamArray objectAtIndex:indexPath.row]];
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(75, 90);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5,0,0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MyLog(@"+++++____++++++%@",[collectionView subviews]);
    
//    [self.labeldelegate chooseLabelValue:@"新闻"];
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
