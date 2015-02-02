//
//  ChooseShcoolViewController.h
//  StudentAssistant
//
//  Created by 迈艾普 on 14-2-26.
//  Copyright (c) 2014年 Baron. All rights reserved.
//

#import "BaseViewController.h"
#import "tableviewIndexSearch.h"
#import "ChineseString.h"
#import "UIImageView+WebCache.h"

@protocol changeValue_school <NSObject>
-(void)changeValue :(NSString * )school;
@end



@interface ChooseShcoolViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray * projectTitle_array;
    NSMutableArray * searchHead_array;
}

@property (nonatomic ,retain) id <changeValue_school> changeSchoolDelegate;
@property (weak, nonatomic)   IBOutlet UITableView *chooseSchool_tableView;
@property (weak, nonatomic)   IBOutlet UILabel *chooseSchool_Label;
@property (weak, nonatomic)   IBOutlet UIImageView *SchoolICon;
@property (retain,nonatomic)  NSMutableArray * schoollist;
@property (retain,nonatomic)  NSMutableArray * schoolIcon_array;
@end
