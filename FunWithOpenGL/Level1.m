//
//  Level1.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "Level1.h"
#import "Entity.h"

@implementation Level1

#pragma mark - Initialization

- (id)init
{
    if (self = [super init]) {
        Entity *entity = [[Entity alloc] initWithOrigin:[EPoint pointWithXComponent:40 yComponent:100]
                                            senseRadius:60
                                           effectRadius:20];
        [self.entities addObject:entity];
    }
    return self;
}

@end
