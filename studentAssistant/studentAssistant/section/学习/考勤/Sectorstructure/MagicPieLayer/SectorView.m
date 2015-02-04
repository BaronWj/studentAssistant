//
//  SectorView.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/16.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "SectorView.h"
//#import "Example2PieView.h"
#import "MyPieElement.h"
#import "PieLayer.h"
@implementation SectorView

-(id)init{
    if (self = [super init]) {
        
        for(int year = 2009; year <= 2014; year++){
            MyPieElement* elem = [MyPieElement pieElementWithValue:(5+arc4random()%8) color:[self randomColor]];
            elem.title = [NSString stringWithFormat:@"%d year", year];
            [self.layer addValues:@[elem] animated:NO];
        }
        
        //mutch easier do this with array outside
        self.layer.transformTitleBlock = ^(PieElement* elem){
            return [(MyPieElement*)elem title];
        };
        self.layer.showTitles = ShowTitlesAlways;

    }
    return self;
}

- (UIColor*)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
