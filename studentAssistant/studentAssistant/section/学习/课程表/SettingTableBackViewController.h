//
//  SettingTableBackViewController.h
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/23.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "settingTableCollectionViewCell.h"
@interface SettingTableBackViewController : BaseViewController
@property(nonatomic, retain) UICollectionView * table_collectionView ;//课表collectionView
@property(nonatomic, retain) NSMutableArray * backImagesArray;//图片集
@end
