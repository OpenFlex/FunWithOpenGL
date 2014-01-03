//
//  EPolygon.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EPolygon.h"

@implementation EPolygon

#pragma mark - Initialization

- (id)init
{
    if (self = [super init]) {
        self.shape = POLYGON;
    }
    return self;
}

@end
