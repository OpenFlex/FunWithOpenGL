//
//  Entity.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/18/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "EGeometric.h"

@class Entity;

typedef NS_ENUM(NSInteger, State) {
    ACTIVE,
    ALERTED,
    NEEDS_REMOVAL
};

typedef void (^ReactionBlock)(Entity *entity);

@interface Entity : EGeometric

@property (nonatomic, assign) CGFloat senseRadius;
@property (nonatomic, assign) CGFloat effectRadius;

@property (nonatomic, assign) State state;

@property (nonatomic, strong) NSMutableSet *affectingEntities;

- (id)initWithOrigin:(EPoint *)origin senseRadius:(CGFloat)senseRadius effectRadius:(CGFloat)effectRadius;

- (void)reactToAffectingEntities:(ReactionBlock)reaction;
- (BOOL)noticesEffectFromEntity:(Entity *)entity;

- (void)addAffectingEntitiesObject:(Entity *)object;

@end
