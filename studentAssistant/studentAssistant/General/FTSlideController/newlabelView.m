//
//  newlabelView.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/6.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "newlabelView.h"
#import "defineSetting.h"
#import "CollectionViewCellCustom.h"
static NSString * const reuseIdentifier = @"Cell";

@implementation newlabelView
@synthesize labeldelegate;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    self.frame = rect;
    self.backgroundColor = [UIColor whiteColor];
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];// 先调用父类的initWithFrame方法
    if (self) {
        self.frame = CGRectMake(0,-ScreenHeight , ScreenWidth, 0);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.itemSize = CGSizeMake(50, 50);
//        layout.sectionInset = UIEdgeInsetsMake(20, 20, 40, 40);
        layout.minimumInteritemSpacing = 20;
        layout.minimumLineSpacing = 20;
        
        custom_collectionView  = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:layout];
        custom_collectionView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        custom_collectionView.delegate = self;
        custom_collectionView.dataSource = self;
        [self addSubview:custom_collectionView];
        custom_collectionView.backgroundColor = [UIColor clearColor];
//        custom_collectionView.backgroundColor = [UIColor colorWithRed:0.895 green:1.000 blue:0.656 alpha:1.000];
        UINib *nib = [UINib nibWithNibName:@"CollectionViewCellCustom"
                                    bundle: [NSBundle mainBundle]];
        [custom_collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
        _iteamArray = @[@"新闻详情",@"社团资讯",@"通知",@"党办"];
        
    }
    return self;
}

#pragma mark
#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Register nib file for the cell
    CollectionViewCellCustom *cell = [[CollectionViewCellCustom alloc]init];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                     forIndexPath:indexPath];
    
    [cell setCurMediaItem: [_iteamArray objectAtIndex:indexPath.row]];
    return cell;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(60, 25);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10,0, 10);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MyLog(@"+++++____++++++%@",[collectionView subviews]);
    
    [self.labeldelegate chooseLabelValue:@"新闻"];
}

//-(void)col
-(void)initDrawRect:(CGRect)rect{
   self.frame = rect;
}

@end
