//
//  EucationModel.m
//  TeacherAssistant
//
//  Created by MyUpinup on 15/1/7.
//  Copyright (c) 2015年 MyUpinup. All rights reserved.
//

#import "EucationModel.h"

@implementation EucationModel

- (instancetype)initWithAttributes:(NSDictionary *)attributes{
    if (self = [self init]) {
        self.title = [attributes objectForKey:@"tilte"];
        
    }
    return self;
}

@end
