//
//  UIViewController+FindTabView.m
//  Veterinarian
//
//  Created by LC_WORLD on 13-12-30.
//  Copyright (c) 2013年 LC_WORLD. All rights reserved.
//

#import "UIViewController+FindTabView.h"
#import "LeveyTabBarController.h"
@implementation UIViewController (FindTabView)

-(UIViewController *)AKtabbarController
{
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[LeveyTabBarController class]]) {
            
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    }
    
    return nil;
}


@end
