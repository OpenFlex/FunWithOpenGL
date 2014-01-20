//
//  Vector.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "EVector.h"

@implementation EVector

#pragma mark - Inititalization

+ (EVector *)vectorWithX:(CGFloat)xComponent y:(CGFloat)yComponent
{
    return [EVector vectorWithX:xComponent y:yComponent z:0.0];
}

+ (EVector *)vectorWithX:(CGFloat)xComponent y:(CGFloat)yComponent z:(CGFloat)zComponent
{
    EVector *vector = [[EVector alloc] init];
    [vector setX:xComponent];
    [vector setY:yComponent];
    [vector setZ:zComponent];
    return vector;
}

+ (EVector *)vectorWithPoint:(EPoint *)point
{
    return [EVector vectorWithX:point.x y:point.y];
}

+ (EVector *)vectorWithNSPoint:(NSPoint)point
{
    return [EVector vectorWithX:point.x y:point.y];
}

#pragma mark - Public methods

- (EVector *)addVector:(EVector *)vector
{
    return [EVector vectorWithX:self.x + vector.x
                              y:self.y + vector.y
                              z:self.z + vector.z];
}

- (EVector *)subtractVector:(EVector *)vector
{
    return [EVector vectorWithX:self.x - vector.x
                              y:self.y - vector.y
                              z:self.z - vector.z];
}

- (EVector *)multiplyVector:(EVector *)vector
{
    return [EVector vectorWithX:self.x * vector.x
                              y:self.y * vector.y
                              z:self.z * vector.z];
}

- (EVector *)multiplyVectorWithConstant:(CGFloat)constant
{
    return [EVector vectorWithX:self.x * constant
                              y:self.y * constant
                              z:self.z * constant];
}

- (EVector *)divideVector:(EVector *)vector
{
    return [EVector vectorWithX:self.x / vector.x
                              y:self.y / vector.y
                              z:self.z / vector.z];
}

- (EVector *)divideVectorByConstant:(CGFloat)constant
{
    return [EVector vectorWithX:self.x / constant
                              y:self.y / constant
                              z:self.z / constant];
}

#pragma mark -

- (void)changeVectorValuesWithPoint:(NSPoint)point
{
    self.x = point.x;
    self.y = point.y;
}

- (void)changeVectorValuesWithX:(CGFloat)xComponent y:(CGFloat)yComponent z:(CGFloat)zComponent
{
    self.x = xComponent;
    self.y = yComponent;
    self.z = zComponent;
}

#pragma mark -

- (EVector *)vectorCopy
{
    return [EVector vectorWithX:self.x y:self.y z:self.z];
}

#pragma mark - Overridden methods

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nx: %.6f\ny: %.6f\nz: %.6f\n-----", self.x, self.y, self.z];
}

@end
