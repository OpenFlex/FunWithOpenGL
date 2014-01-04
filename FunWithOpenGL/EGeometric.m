//
//  EGeometric.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EGeometric.h"
#import <OpenGL/gl.h>

@implementation EGeometric

#pragma mark - Public methods

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

- (EPoint *)origin
{
    return (!_origin) ?
    _origin = [EPoint zeroPoint] :
    _origin;
}

@end
