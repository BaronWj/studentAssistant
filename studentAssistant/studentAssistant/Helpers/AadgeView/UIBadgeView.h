//
//  UIBadgeView.h
//  UIBadgeView
//  
//  Created by MyUpinup on 15/1/15.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface UIBadgeView : UIView {
	NSUInteger width;
	NSString *badgeString;
	
	UIFont *font;
	
	UIColor *badgeColor;
	UIColor *badgeColorHighlighted;
}

@property (nonatomic, readonly) NSUInteger width;
@property (nonatomic, retain) NSString *badgeString;
@property (nonatomic, assign) UITableViewCell *parent;
@property (nonatomic, assign) BOOL shadowEnabled;
@property (nonatomic, retain) UIColor *badgeColor;
@property (nonatomic, retain) UIColor *badgeColorHighlighted;

- (void) drawRoundedRect:(CGRect) rrect inContext:(CGContextRef) context 
			  withRadius:(CGFloat) radius;


@end
