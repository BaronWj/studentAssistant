//
//  HeadView.h
//  表格
//
//  Created by zzy on 14-5-5.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "defineSetting.h"
@class HeadView;

@protocol HeadViewDelegate <NSObject>

-(void)headView:(HeadView *)headView point:(CGPoint)point;

@end

@interface HeadView : UIView
@property (nonatomic,strong) NSString *num;
@property (nonatomic,strong) NSString *detail;
@property (nonatomic,strong) UILabel *numRoom;
@property (nonatomic,strong) UILabel *detailRoom;
@property (nonatomic,assign) id <HeadViewDelegate> delegate;
@end
