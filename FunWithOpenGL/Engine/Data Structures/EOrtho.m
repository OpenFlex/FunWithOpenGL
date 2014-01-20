//
//  EOrtho.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EOrtho.h"

@implementation EOrtho

- (EOrtho *)initWithLeft:(NSInteger)left
                                   right:(NSInteger)right
                                  bottom:(NSInteger)bottom
                                     top:(NSInteger)top
                                    near:(NSInteger)near
                                     far:(NSInteger)far
{
    if (self = [super init]) {
        self.left = left;
        self.right = right;
        self.bottom = bottom;
        self.top = top;
        self.near = near;
        self.far = far;
    }
    return self;
}

@end
