//
//  KDActivityIndicatorView.m
//  kdnet
//
//  Created by MyUpinup on 15/1/5.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//
//

#import "KDActivityIndicatorView.h"

@interface KDActivityIndicatorView () {
    UIImageView *_refreshImageView;
    BOOL _isAnimating;
}
@end

@implementation KDActivityIndicatorView

- (id)init {
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, 25.0f, 25.0f)];
    if (self) {
        _hidesWhenStopped = YES;
        _isAnimating = NO;
        _style = KDActivityIndicatorViewStyleDefault;
        
        self.userInteractionEnabled = NO;
        
        _refreshImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon50reload.png"]];
        _refreshImageView.hidden = YES;
        
        [self addSubview:_refreshImageView];
    }
    
    return self;
}

- (id)initWithActivityIndicatorStyle:(KDActivityIndicatorViewStyle)style {
    self = [self init];
    if (self) {
        _refreshImageView.image = style == KDActivityIndicatorViewStyleWhite?[UIImage imageNamed:@"icon50wreload.png"]:[UIImage imageNamed:@"icon50reload.png"];
    }
    
    return self;
}

- (void)setStyle:(KDActivityIndicatorViewStyle)style {
    _style = style;
    _refreshImageView.image = style == KDActivityIndicatorViewStyleWhite?[UIImage imageNamed:@"icon50wreload.png"]:[UIImage imageNamed:@"icon50reload.png"];
}

- (void)animating {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0f];
    rotationAnimation.duration = 0.6f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    rotationAnimation.removedOnCompletion = NO;
    [_refreshImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}

- (void)startAnimating {
    if (!_isAnimating) {
        _isAnimating = YES;
        _refreshImageView.hidden = NO;
        [self animating];
    }
}

- (void)stopAnimating {
    if (_isAnimating) {
    //    KCLog(@"stopAnimating");
        _isAnimating = NO;
        _refreshImageView.hidden = _hidesWhenStopped;
        _refreshImageView.transform = CGAffineTransformMakeRotation(0.0f);
        [_refreshImageView.layer removeAnimationForKey:@"rotationAnimation"];
    }
}

- (BOOL)isAnimating {
    return _isAnimating;
}

@end
