//
//  EFallingTriangle.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "EFallingTriangle.h"

@implementation EFallingTriangle

- (id)init
{
    if (self = [super init]) {
        __unsafe_unretained typeof(self) weakSelf = self;
        self.animationBlock = ^{
            if (weakSelf.origin.x >= 480 || weakSelf.origin.x <= 0) {
                weakSelf.velocity.x *= -1;
            }
            
            if (weakSelf.origin.y >= 360 || weakSelf.origin.y <= 0) {
                weakSelf.velocity.y *= -1;
            }
        };
    }
    return self;
}

@end
