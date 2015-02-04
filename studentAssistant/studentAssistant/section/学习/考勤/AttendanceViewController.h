//
//  AttendanceViewController.h
//  studentAssistant
//
//  Created by MyUpinup on 15/2/3.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CollapseClick.h"
#import "DropDownChooseProtocol.h"
#import "SectorView.h"

@interface AttendanceViewController : BaseViewController<CollapseClickDelegate,UITextFieldDelegate>{
    IBOutlet UIView *test3View;
    __weak IBOutlet CollapseClick *myCollapseClick;
}
@property(nonatomic,strong)SectorView * sectorView;
@property (strong, nonatomic) IBOutlet Example2PieView *testView1;
@property (strong, nonatomic) IBOutlet Example2PieView *testView2;
@end
