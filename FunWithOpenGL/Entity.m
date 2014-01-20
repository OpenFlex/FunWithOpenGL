//
//  Entity.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/18/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "Entity.h"

@implementation Entity

#pragma mark - Initialization

- (EGeometric *)initWithOrigin:(EPoint *)origin senseRadius:(CGFloat)senseRadius effectRadius:(CGFloat)effectRadius
{
    if (self = [super initWithOrigin:origin]) {
        self.senseRadius = senseRadius;
        self.effectRadius = effectRadius;
        [self setShape:POLYGON];
    }
    return self;
}

#pragma mark - Public methods

- (void)update
{
    [self draw];
    [self reactToAffectingEntities:nil];
}

- (void)draw
{
    glColor3f(self.color.red, self.color.green, self.color.blue);
    glBegin(GL_POLYGON);
    {
        glVertex2f(self.origin.x - self.senseRadius, self.origin.y);
        glVertex2f(self.origin.x, self.origin.y - self.senseRadius);
        glVertex2f(self.origin.x + self.senseRadius, self.origin.y);
        glVertex2f(self.origin.x, self.origin.y + self.senseRadius);
    }
    glEnd();
}

- (void)reactToAffectingEntities:(ReactionBlock)reaction
{
    static BOOL shouldCallRemove;
    for (Entity *entity in self.affectingEntities) {
        if (![self noticesEffectFromEntity:entity]) {
            entity.state = NEEDS_REMOVAL;
            shouldCallRemove = YES;
        } else if (reaction != nil) {
            reaction(entity);
        }
    }
    
    if (shouldCallRemove) {
        [self removeNonAffectingEntities];
        shouldCallRemove = NO;
    }
}

- (void)removeNonAffectingEntities
{
    NSSet *affectingEntitiesCopy = [self.affectingEntities copy];
    for (Entity *entity in affectingEntitiesCopy) {
        if (entity.state == NEEDS_REMOVAL) {
            [self.affectingEntities removeObject:entity];
        }
    }
}

#pragma mark - Utility methods

- (BOOL)noticesEffectFromEntity:(Entity *)entity
{
    float radiusSum = self.effectRadius + entity.effectRadius;
    float distance = [self.origin distanceFromPoint:entity.origin];
    return distance < radiusSum;
}

#pragma mark - Overridden properties

- (NSMutableSet *)affectingEntities
{
    if (_affectingEntities == nil) {
        _affectingEntities = [NSMutableSet new];
    }
    return _affectingEntities;
}

- (void)addAffectingEntitiesObject:(Entity *)object
{
    [self.affectingEntities addObject:object];
}

@end
