//
//  CollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by MyUpinup on 14/12/29.
//  Copyright (c) 2014年 MyUpinup. All rights reserved.
//

#import "CollectionViewCellCustom.h"
@implementation CollectionViewCellCustom
//
//@synthesize curMediaItem = _curMediaItem;
- (void)awakeFromNib {
    // Initialization code
    
    NSLog(@"awakeFromNib");
//    _ImageViewHead.image = [UIImage imageNamed:@"teacherhead2"];
    NSLog(@"__-%@",_CurMediaItem);
//    _ImageViewHead.frame = CGRectMake(10, 20, 90, 50);

//    [_ImageViewButton.layer setMasksToBounds:YES];
//    [_ImageViewButton.layer setCornerRadius:4];
//    [_ImageViewButton.layer setBorderColor:[UIColor grayColor].CGColor] ;
//    [_ImageViewButton.layer setBorderWidth:0.1];


}
- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"self");
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];// 先调用父类的initWithFrame方法
    if (self) {
        NSLog(@"self.frame");
//        [_ImageViewButton.layer setMasksToBounds:YES];
//        [_ImageViewButton.layer setCornerRadius:4];

    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"aDecoder");
        

    }
    return self;
}

-(void)setCurMediaItem:(NSString *)CurMediaItem{
    _CurMediaItem = CurMediaItem;
//    [_ImageViewButton setBackgroundImage:[UIImage imageNamed:@"evaluate"] forState:UIControlStateNormal];
    if([CurMediaItem isEqualToString:@"新闻详情"]){
        [_ImageViewButton setBackgroundImage:[UIImage imageNamed:@"labelRectNormalSelect"] forState:UIControlStateNormal];
        [_ImageViewButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }else{
        [_ImageViewButton setBackgroundImage:[UIImage imageNamed:@"labelRectNormal"] forState:UIControlStateNormal];
        [_ImageViewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    [_ImageViewButton setTitle:CurMediaItem forState:UIControlStateNormal];
    NSLog(@"+++++========++++%@",_CurMediaItem);
}
//- (NSArray *)getCurMediaItem{
//   
//}
@end
