//
//  ObjectManager.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "Manager.h"

@interface ObjectManager : Manager

@property (nonatomic, strong, readonly) NSMutableSet *objects;

+ (ObjectManager *)sharedInstance;

- (void)addObject:(EObject *)object;
- (void)updateObjects;

@end
