//
//  Triangle.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EGeometric.h"

@class EPoint;

@interface ETriangle : EGeometric

+ (ETriangle *)eqilateralTriangleCenteredAtPoint:(EPoint *)point withSideLength:(CGFloat)sideLength;
+ (ETriangle *)triangleWithFirstPoint:(EPoint *)firstPoint secondPoint:(EPoint *)secondPoint thirdPoint:(EPoint *)thirdPoint;

@end
