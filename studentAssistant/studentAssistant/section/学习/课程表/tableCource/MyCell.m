//
//  MyCell.m
//  表格
//
//  Created by zzy on 14-5-6.
//  Copyright (c) 2014年 zzy. All rights reserved.
//


#import "MyCell.h"
#import "HeadView.h"
#import "MeetModel.h"
#import "defineSetting.h"
@interface MyCell()<HeadViewDelegate>

@end

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        for(int i=0;i<20;i++){
        
            HeadView *headView=[[HeadView alloc]initWithFrame:CGRectMake(i*kWidth, 0, kWidth-kWidthMargin, kHeight+kHeightMargin)];
            headView.delegate=self;
            headView.backgroundColor=[UIColor clearColor];
            [self.contentView addSubview:headView];
        }
        
    }
    return self;
}
-(void)headView:(HeadView *)headView point:(CGPoint)point
{
    if([self.delegate respondsToSelector:@selector(myHeadView:point:)]){
    
        [self.delegate myHeadView:headView point:point];
    }

}
-(void)setCurrentTime:(NSMutableArray *)currentTime
{
     _currentTime=currentTime;
    int count=(int)currentTime.count;
    if(count>0){
        for(int i=0;i<count;i++){
            MeetModel *model=currentTime[i];
            HeadView *headView;
            
//            if ([model.meetRoom isEqualToString:@"001"]) {
//                NSArray *room=[model.meetRoom componentsSeparatedByString:@"00"];
//                //                NSLog(@"___%@",self.contentView.subviews);
//                headView=(HeadView *)self.contentView.subviews[[[room lastObject] intValue]];
//                headView.backgroundColor=UIColorFromRGB(0x0a8ac2) ;
//                headView.detailRoom.text = @"2a2";
//            }
            
            if([model.meetRoom isEqualToString:@"000"] ){
                MyLog(@"))))))))))))0000000000(((((((((");
                headView=(HeadView *)self.contentView.subviews[0];
            }else {
                NSArray *room=[model.meetRoom componentsSeparatedByString:@"00"];
//                NSLog(@"___%@",self.contentView.subviews);
                headView=(HeadView *)self.contentView.subviews[[[room lastObject] intValue]];
                if ([model.meetRoom isEqualToString:@"001"]) {
                    headView.backgroundColor=UIColorFromRGB(0x0a8ac2) ;
                    headView.detailRoom.text = @"艺术概论";

                }
            }
//            for(HeadView *leftHeadView in self.contentView.subviews){
//                if(headView!=leftHeadView) {
//                    headView.backgroundColor = [UIColor clearColor];
//                }
//            }
        }
    }else{
        for(HeadView *headView in self.contentView.subviews){
            headView.backgroundColor = [UIColor clearColor];
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
