//
//  ECollision.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "ECollision.h"

@implementation ECollision

+ (ECollision *)collisionWithCollisionBlock:(CollisionBlock)collisionBlock
{
    ECollision *collision = [ECollision new];
    collision.collisionBlock = collisionBlock;
    return collisionBlock;
}

- (void)performCollision
{
    if (self.collisionBlock) {
        self.collisionBlock();
    }
}

@end
