//
//  Environment.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/18/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Environment : NSObject

@property (nonatomic, strong) NSMutableSet *entities;
@property (nonatomic, strong) NSMutableSet *activeEntities;

- (void)update;

@end
