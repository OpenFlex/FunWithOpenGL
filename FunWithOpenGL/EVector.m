//
//  Vector.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EVector.h"

@implementation EVector

#pragma mark - Inititalization

+ (EVector *)vectorWithXComponent:(CGFloat)xComponent yComponent:(CGFloat)yComponent
{
    return [EVector vectorWithXComponent:xComponent yComponent:yComponent zComponent:0.0];
}

+ (EVector *)vectorWithXComponent:(CGFloat)xComponent yComponent:(CGFloat)yComponent zComponent:(CGFloat)zComponent
{
    EVector *vector = [[EVector alloc] init];
    [vector setX:xComponent];
    [vector setY:yComponent];
    [vector setZ:zComponent];
    return vector;
}

+ (EVector *)vectorWithPoint:(NSPoint)point
{
    return [EVector vectorWithXComponent:point.x yComponent:point.y];
}

#pragma mark - Public methods

- (EVector *)addVector:(EVector *)vector
{
    return [EVector vectorWithXComponent:self.x + vector.x yComponent:self.y + vector.y zComponent:self.z + vector.z];
}

- (EVector *)subtractVector:(EVector *)vector
{
    return [EVector vectorWithXComponent:self.x - vector.x yComponent:self.y - vector.y zComponent:self.z - vector.z];
}

- (EVector *)multiplyVector:(EVector *)vector
{
    return [EVector vectorWithXComponent:self.x * vector.x yComponent:self.y * vector.y zComponent:self.z * vector.z];
}

#pragma mark - 

- (void)changeVectorValuesWithPoint:(NSPoint)point
{
    self.x = point.x;
    self.y = point.y;
}

- (void)changeVectorValuesWithXComponent:(CGFloat)xComponent yComponent:(CGFloat)yComponent zComponent:(CGFloat)zComponent
{
    self.x = xComponent;
    self.y = yComponent;
    self.z = zComponent;
}

#pragma mark -

- (EVector *)vectorCopy
{
    return [EVector vectorWithXComponent:self.x yComponent:self.y zComponent:self.z];
}

#pragma mark - Overridden methods

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nx: %.3f\ny: %.3f\nz: %.3f\n-----", self.x, self.y, self.z];
}

@end
