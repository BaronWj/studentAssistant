//
//  newlabelView.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/6.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol chooselabelDlegate <NSObject>
@optional
-(void)chooseLabelValue:(NSString *)labelValue;

@end


@interface newlabelView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView * custom_collectionView;
    id <chooselabelDlegate> labeldelegate;
}
@property(nonatomic,strong)id<chooselabelDlegate>labeldelegate;
@property(nonatomic,strong)NSArray * iteamArray;
-(void)initDrawRect:(CGRect)rect;
@end
