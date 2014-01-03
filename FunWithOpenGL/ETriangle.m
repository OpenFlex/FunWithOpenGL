//
//  Triangle.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "ETriangle.h"

@implementation ETriangle

#pragma mark - Initialization

+ (ETriangle *)eqilateralTriangleCenteredAtPoint:(EPoint *)point withSideLength:(CGFloat)sideLength
{
    float sideLengthHalved = sideLength / 2.0;
    float verticalPositionOfBottom = point.y - (sideLength / 2) / sqrtf(3.0);
    float verticalPositionOfTop = point.y + sideLength / sqrtf(3.0);
    
    EPoint *firstPoint = [EPoint pointWithXComponent:point.x - sideLengthHalved yComponent:verticalPositionOfBottom];
    EPoint *secondPoint = [EPoint pointWithXComponent:point.x yComponent:verticalPositionOfTop];
    EPoint *thirdPoint = [EPoint pointWithXComponent:point.x + sideLengthHalved yComponent:verticalPositionOfBottom];
    
    return [ETriangle triangleWithFirstPoint:firstPoint secondPoint:secondPoint thirdPoint:thirdPoint];
}

+ (ETriangle *)triangleWithFirstPoint:(EPoint *)firstPoint secondPoint:(EPoint *)secondPoint thirdPoint:(EPoint *)thirdPoint
{
    ETriangle *triangle = [ETriangle new];
    triangle.points = @[firstPoint, secondPoint, thirdPoint];
    return triangle;
}

- (id)init
{
    if (self = [super init]) {
        [self setShape:TRIANGLES];
    }
    return self;
}

@end
