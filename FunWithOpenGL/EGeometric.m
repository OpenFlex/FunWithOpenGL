//
//  EGeometric.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EGeometric.h"
#import "ECollision.h"
#import <OpenGL/gl.h>

@implementation EGeometric

#pragma mark - Initialization

- (EGeometric *)initWithOrigin:(EPoint *)origin
{
    if (self = [super init]) {
        self.origin = origin;
    }
    return self;
}

#pragma mark - Public methods

- (void)update
{
//    [self applyForces];
    [self draw];
}

- (void)draw
{
    if (self.animationBlock) {
        [[EEventQueue sharedInstance] addObjectToEventQueue:[EEventObject initWithEventBlock:self.animationBlock]];
    }
    
    glColor3f(self.color.red, self.color.green, self.color.blue);
    glBegin([self convertShapeToGLenum]);
    for (EPoint *point in self.points) {
        glVertex2f(point.x + self.origin.x, point.y + self.origin.y);
    }
    glEnd();
}

- (void)translateWithVector:(EVector *)vector
{
    for (EPoint *point in self.points) {
        [point addVector:vector];
    }
}

- (void)applyForces
{
//    NSTimeInterval delta = [[EGame sharedInstance].ticker logicDelta];
//    
//    for (int i = 0; i < self.forces.count; i++) {
//        EForce *force = [self.forces objectAtIndex:i];
//        
//        EVector *resultantAcceleration = [force.direction multiplyVectorWithConstant:force.magnitude];
//        [resultantAcceleration divideVectorByConstant:self.mass];
//        
//        [self.acceleration addVector:resultantAcceleration];
////        [self.acceleration multiplyByConstant:delta * 2000];
//        
//        [self.velocity addVector:[EVector vectorWithPoint:self.acceleration]];
//        
//        EVector *deltaVector = [EVector vectorWithPoint:self.velocity];
////        deltaVector = [deltaVector multiplyVectorWithConstant:delta * 2000];
//        [self.origin addVector:deltaVector];
//        
//        if (force.temporaryForce) {
//            [self.forces removeObject:force];
//            [self.acceleration subtractVector:resultantAcceleration];
//            i--;
//        }
//    }
}

#pragma mark - Private methods

- (GLenum)convertShapeToGLenum
{
    switch (self.shape) {
        case POINTS:
            return GL_POINTS;
        case LINES:
            return GL_LINES;
        case LINE_STRIP:
            return GL_LINE_STRIP;
        case TRIANGLES:
            return GL_TRIANGLES;
        case TRIANGLE_STRIP:
            return GL_TRIANGLE_STRIP;
        case TRIANGLE_FAN:
            return GL_TRIANGLE_FAN;
        case QUADS:
            return GL_QUADS;
        case QUAD_STRIP:
            return GL_QUAD_STRIP;
        case POLYGON:
            return GL_POLYGON;
    }
}

#pragma mark - Overridden properties

- (EPoint *)acceleration
{
    return (!_acceleration) ?
    _acceleration = [EPoint zeroPoint] :
    _acceleration;
}

- (EPoint *)velocity
{
    return (!_velocity) ?
    _velocity = [EPoint zeroPoint] :
    _velocity;
}

- (EPoint *)origin
{
    return (!_origin) ?
    _origin = [EPoint zeroPoint] :
    _origin;
}

- (NSMutableArray *)forces
{
    return (!_forces) ?
    _forces = [NSMutableArray new] :
    _forces;
}

@end
