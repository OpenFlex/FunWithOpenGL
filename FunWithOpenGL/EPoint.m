//
//  EPoint.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EPoint.h"

@implementation EPoint

#pragma mark - Initialization

+ (EPoint *)pointWithXComponent:(CGFloat)xComponent yComponent:(CGFloat)yComponent
{
    EPoint *point = [[EPoint alloc] init];
    point.x = xComponent;
    point.y = yComponent;
    return point;
}

+ (EPoint *)pointWithPoint:(NSPoint)point
{
    return [EPoint pointWithXComponent:point.x yComponent:point.y];
}

+ (EPoint *)zeroPoint
{
    return [EPoint pointWithXComponent:0 yComponent:0];
}

- (id)init
{
    if (self = [super init]) {
        self.shape = POINTS;
    }
    return self;
}

#pragma mark -

- (void)addVector:(EVector *)vector
{
    self.x += vector.x;
    self.y += vector.y;
}

- (BOOL)pointInRect:(NSRect)rect
{
    return !(self.x < rect.origin.x || self.y < rect.origin.y || self.x > rect.origin.x + rect.size.width || self.y > rect.origin.y + rect.size.height);
}

#pragma mark - Overridden methods

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nx: %.3f\ny: %.3f", self.x, self.y];
}

@end
