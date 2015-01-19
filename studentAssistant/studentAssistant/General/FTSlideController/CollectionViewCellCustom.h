//
//  CollectionViewCell.h
//  UICollectionViewDemo
//
//  Created by MyUpinup on 14/12/29.
//  Copyright (c) 2014年 MyUpinup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCellCustom : UICollectionViewCell
//@property (strong, nonatomic) HtmlMediaItem *curMediaItem;
//-(void)setCurMediaItem;
@property (strong, nonatomic) IBOutlet UIButton *ImageViewButton;
@property (strong, nonatomic)  UIImageView *image_head;
@property (strong,nonatomic) NSString * CurMediaItem;
@end
