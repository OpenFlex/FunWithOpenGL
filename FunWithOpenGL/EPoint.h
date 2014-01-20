//
//  EPoint.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "EGeometric.h"

@class EVector;

@interface EPoint : EGeometric

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

+ (EPoint *)pointWithXComponent:(CGFloat)xComponent yComponent:(CGFloat)yComponent;
+ (EPoint *)pointWithPoint:(NSPoint)point;
+ (EPoint *)zeroPoint;

- (void)addVector:(EVector *)vector;
- (void)subtractVector:(EVector *)vector;

- (EPoint *)subtractPoint:(EPoint *)point;

- (void)multiplyByConstant:(CGFloat)constant;

- (EPoint *)divideByConstant:(CGFloat)constant;


- (BOOL)pointInRect:(NSRect)rect;

- (CGFloat)distanceFromPoint:(EPoint *)point;

@end
