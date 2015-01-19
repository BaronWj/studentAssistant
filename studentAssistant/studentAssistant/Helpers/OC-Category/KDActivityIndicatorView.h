//
//  KDActivityIndicatorView.h
//  kdnet
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KDActivityIndicatorViewStyle) {
    KDActivityIndicatorViewStyleDefault,
    KDActivityIndicatorViewStyleWhite,
};

@interface KDActivityIndicatorView : UIView

@property(nonatomic) BOOL hidesWhenStopped; // default is YES
@property(nonatomic) KDActivityIndicatorViewStyle style;

- (id)initWithActivityIndicatorStyle:(KDActivityIndicatorViewStyle)style;

- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;
@end
