//
//  UITableView+tableViewExtraCellHidden.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/14.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "UITableView+tableViewExtraCellHidden.h"
#import "defineSetting.h"
@implementation UITableView (tableViewExtraCellHidden)
- (void)setExtraCellLineHidden: (BOOL)showState

{
    if (showState == YES) {
        UIView *view = [UIView new];
        
        view.backgroundColor = [UIColor clearColor];
        
        [self setTableFooterView:view];
    }else{
        return;
    }
    
}



@end
