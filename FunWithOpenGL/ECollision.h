//
//  ECollision.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CollisionBlock)();

@interface ECollision : NSObject

@property (copy) CollisionBlock collisionBlock;

+ (ECollision *)collisionWithCollisionBlock:(CollisionBlock)collisionBlock;
- (void)performCollision;

@end
