//
//  EGeometric.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EColor, EVector, EPoint;

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

@interface EGeometric : NSObject

@property (nonatomic, assign) Shape shape;
@property (nonatomic, strong) EColor *color;
@property (nonatomic, strong) EPoint *origin;
@property (nonatomic, strong) NSArray *points;

- (void)draw;
- (void)translateWithVector:(EVector *)vector;

@end
