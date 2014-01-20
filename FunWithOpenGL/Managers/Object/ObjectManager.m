//
//  ObjectManager.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "ObjectManager.h"

@implementation ObjectManager

@synthesize objects = _objects;

#pragma mark - Initialization

+ (ObjectManager *)sharedInstance
{
    static ObjectManager *objectManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        objectManager = [[ObjectManager alloc] init];
    });
    return objectManager;
}

#pragma mark - Public methods

- (void)addObject:(EObject *)object
{
    [self.objects addObject:object];
}

- (void)updateObjects
{
    for (EObject *object in self.objects) {
        [object update];
    }
}

#pragma mark - Overridden properties

- (NSMutableSet *)objects
{
    if (_objects == nil) {
        _objects = [[NSMutableSet alloc] init];
    }
    return _objects;
}

@end
