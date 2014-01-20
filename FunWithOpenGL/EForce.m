//
//  EForce.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "EForce.h"

@implementation EForce

+ (EForce *)forceWithMagnitude:(CGFloat)magnitude direction:(EVector *)direction temporary:(BOOL)temporary;
{
    EForce *force = [EForce new];
    force.magnitude = magnitude;
    force.direction = direction;
    force.temporaryForce = temporary;
    return force;
}

@end
