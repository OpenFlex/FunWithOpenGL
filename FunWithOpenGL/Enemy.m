//
//  Enemy.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/18/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "Enemy.h"
#import "Player.h"

@implementation Enemy

- (void)reactToAffectingEntities:(ReactionBlock)reaction
{
    __unsafe_unretained Enemy *selfCopy = self;
    ReactionBlock block = ^(Entity *entity){
        if ([entity isKindOfClass:[Player class]]) {
            selfCopy.origin = [selfCopy.origin subtractPoint:[[selfCopy.origin subtractPoint:entity.origin] divideByConstant:20]];
        }
    };
    [super reactToAffectingEntities:block];
}

@end
