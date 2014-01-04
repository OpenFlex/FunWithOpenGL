//
//  EFlashingTriangle.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EFlashingTriangle.h"

@implementation EFlashingTriangle

- (id)init
{
    if (self = [super init]) {
        __unsafe_unretained typeof(self) weakSelf = self;
        self.animationBlock = ^{
            weakSelf.color = [EColor randomColor];
        };
    }
    return self;
}

@end
