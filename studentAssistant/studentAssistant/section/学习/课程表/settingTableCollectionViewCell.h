//
//  settingTableCollectionViewCell.h
//  TeacherAssistant
//
//  Created by 潘伟杰 on 15/1/25.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingTableCollectionViewCell : UICollectionViewCell
//@property(nonatomic ,strong)NSString *
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
-(void)selectCollectionView:(NSIndexPath *)indexPath;
@property (nonatomic ,assign)BOOL selectState;
@property (nonatomic ,strong)NSString * image_name;
@end
