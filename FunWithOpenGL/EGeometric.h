//
//  EGeometric.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EColor, EVector, EPoint, ECollision;

typedef NS_ENUM(NSInteger, Shape) {
    POINTS,
    LINES,
    LINE_STRIP,
    TRIANGLES,
    TRIANGLE_STRIP,
    TRIANGLE_FAN,
    QUADS,
    QUAD_STRIP,
    POLYGON,
};

typedef void(^AnimationBlock)();

@interface EGeometric : NSObject

@property (nonatomic, strong) AnimationBlock animationBlock;

@property (nonatomic, assign) Shape shape;
@property (nonatomic, assign) CGFloat mass;

@property (nonatomic, strong) EPoint *acceleration;
@property (nonatomic, strong) EPoint *velocity;
@property (nonatomic, strong) EPoint *origin;

@property (atomic, strong) ECollision *collision;
@property (nonatomic, strong) EColor *color;
@property (nonatomic, strong) NSArray *points;
@property (nonatomic, strong) NSMutableArray *forces;

- (EGeometric *)initWithOrigin:(EPoint *)origin;

- (void)update;
- (void)draw;
- (void)translateWithVector:(EVector *)vector;
- (void)applyForces;

@end
