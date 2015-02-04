//
//  AttendanceViewController.m
//  studentAssistant
//
//  Created by MyUpinup on 15/2/3.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "AttendanceViewController.h"
#import "SectorView.h"
#import "Example2PieView.h"
#import "MyPieElement.h"
#import "PieLayer.h"
@interface AttendanceViewController (){
    NSMutableArray * chooseArray;
    UIView * view ;
}

@end

@implementation AttendanceViewController
@synthesize testView1;
@synthesize testView2;
- (void)viewDidLoad {
    

    [super viewDidLoad];
    
//   [self.view addSubview: [self createView]];
    // Do any additional setup after loading the view from its nib.
    myCollapseClick.CollapseClickDelegate = self;
    [myCollapseClick reloadCollapseClick];
    
    // If you want a cell open on load, run this method:
    [myCollapseClick openCollapseClickCellAtIndex:0 animated:NO];
}

-(UIView *)createView{
    Example2PieView * view_custom = [[Example2PieView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 280)];
    view_custom.backgroundColor = [UIColor clearColor];
    view_custom.userInteractionEnabled = YES;
    NSArray * titleArray = @[@"迟到 30",@"早退 20",@"事假 20",@"病假 24",@"正常 45",@"旷课33"];
    for(int year = 0; year <=5; year++){
        MyPieElement* elem = [MyPieElement pieElementWithValue:(5+arc4random()%8) color:[self randomColor]];
        elem.title = [NSString stringWithFormat:@"%@", [titleArray objectAtIndex:year]];
        [view_custom.layer addValues:@[elem] animated:NO];
    }
    
    //mutch easier do this with array outside
    view_custom.layer.transformTitleBlock = ^(PieElement* elem){
        return [(MyPieElement*)elem title];
    };
    view_custom.layer.showTitles = ShowTitlesAlways;
    
    //    [view_custom addSubview:view_custom];
    return view_custom;
    
}
- (UIColor*)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
#pragma mark - Collapse Click Delegate

// Required Methods
-(int)numberOfCellsForCollapseClick {
    return 3;
}

-(NSString *)titleForCollapseClickAtIndex:(int)index {
    switch (index) {
        case 0:
            return @"王晓敏";
            break;
        case 1:
            return @"张建";
            break;
        default:
            return @"小明";
            break;
    }
}

-(UILabel *)createLabel{
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(30, 0, 200, 40);
    label.backgroundColor = [UIColor redColor];
    label.text = @"小明";
    return label;
}
-(UIView *)viewForCollapseClickContentViewAtIndex:(int)index {
//    switch (index) {
//        case 0:
            return  [self createView];
//            break;
//        case 1:
//            return [self createView];
//            break;
//        default:
//            return  [self createView];
//            break;
//    }
}

// Optional Methods
-(UIColor *)colorForCollapseClickTitleViewAtIndex:(int)index {
//    return [UIColor colorWithRed:25/255.0f green:86/255.0f blue:93/255.0f alpha:1.0];
    return [UIColor whiteColor];
}


-(UIColor *)colorForTitleLabelAtIndex:(int)index {
    return [UIColor blackColor];
}

-(UIColor *)colorForTitleArrowAtIndex:(int)index {
    return [UIColor blackColor];
}

-(void)didClickCollapseClickCellAtIndex:(int)index isNowOpen:(BOOL)open {
    NSLog(@"%d and it's open:%@", index, (open ? @"YES" : @"NO"));
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
