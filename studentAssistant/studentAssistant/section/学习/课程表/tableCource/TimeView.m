//
//  TimeView.m
//  表格
//
//  Created by zzy on 14-5-6.
//  Copyright (c) 2014年 zzy. All rights reserved.
//
#define kCount 10
#import "TimeView.h"
#import "MyLabel.h"
#import "TimeCell.h"
@interface TimeView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *times;
@end

@implementation TimeView

//-(void)setWeekArray:(NSArray *)weekArray{
//    if ([weekArray count]) {
//        self.times=[NSMutableArray array];
//
//        for (int i=0; i<=kCount; i++) {
//            int currentTime=i;
//            NSString *time=[NSString stringWithFormat:@"%@",[_weekArray objectAtIndex:currentTime]];
//            [self.times addObject:time];
//        }
//
//    }
//
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
         self.timeTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
         self.timeTableView.delegate=self;
         self.timeTableView.dataSource=self;
         self.timeTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
         self.timeTableView.userInteractionEnabled=NO;
         self.timeTableView.bounces = YES;
         self.timeTableView.backgroundColor = [UIColor clearColor];
         [self addSubview: self.timeTableView];
        
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_weekArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    TimeCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        
        cell=[[TimeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.timeLabel.text=self.weekArray[indexPath.row];
    return cell;
}
@end
