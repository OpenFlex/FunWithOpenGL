//
//  EFallingTriangle.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EFallingTriangle.h"

@implementation EFallingTriangle

- (id)init
{
    if (self = [super init]) {
        __unsafe_unretained typeof(self) weakSelf = self;
        self.animationBlock = ^{
            CGFloat verticalDisplacement = -20 * [[EGame sharedInstance].ticker logicDelta];
            [weakSelf translateWithVector:[EVector vectorWithXComponent:0.0 yComponent:verticalDisplacement]];
        };
    }
    return self;
}

@end
