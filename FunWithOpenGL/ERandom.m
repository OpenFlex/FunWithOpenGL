//
//  ERandom.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "ERandom.h"

#define ARC4RANDOM_MAX 0x100000000

@implementation ERandom

+ (float)randomNumberBetweenZeroAndOne
{
    return (float)arc4random() / ARC4RANDOM_MAX;
}

@end
