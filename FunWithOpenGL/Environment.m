//
//  Environment.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/18/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "Environment.h"
#import "Entity.h"

@implementation Environment

- (void)update
{
    [self updateActiveEntities];
    [self updateEntities];
}

- (void)updateActiveEntities
{
    static BOOL shouldRemoveEntities;
    for (Entity *entity in self.activeEntities) {
        if (entity.state != NEEDS_REMOVAL) {
            [self checkInteractions:entity];
        } else {
            shouldRemoveEntities = YES;
        }
    }
    
    if (shouldRemoveEntities) {
        [self removeNonActiveEntities];
        shouldRemoveEntities = NO;
    }
}

- (void)removeNonActiveEntities
{
    NSSet *activeEntitiesCopy = [self.activeEntities copy];
    for (Entity *entity in activeEntitiesCopy) {
        if (entity.state == NEEDS_REMOVAL) {
            [self.activeEntities removeObject:entity];
        }
    }
}

- (void)updateEntities
{
    for (Entity *entity in self.entities) {
        [entity update];
    }
}

- (void)checkInteractions:(Entity *)entity
{
    for (Entity *sensingEntity in self.entities) {
        if ([sensingEntity noticesEffectFromEntity:entity]) {
            [sensingEntity addAffectingEntitiesObject:entity];
        }
    }
}

#pragma mark - Overridden properties

- (NSMutableSet *)entities
{
    if (_entities == nil) {
        _entities = [NSMutableSet new];
    }
    return _entities;
}

- (NSMutableSet *)activeEntities
{
    if (_activeEntities == nil) {
        _activeEntities = [NSMutableSet new];
    }
    return _activeEntities;
}

@end
