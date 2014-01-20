//
//  EObjectController.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EObjectController.h"

#import "EFlashingTriangle.h"
#import "EFallingTriangle.h"
#import "ETriangle.h"

@interface EObjectController ()

@property (nonatomic, strong) EFlashingTriangle *_flashingTriangle;
@property (nonatomic, strong) EFallingTriangle *_fallingTriangle;

@end

@implementation EObjectController

#pragma mark - Public methods

- (void)displayObjects
{
    [self._flashingTriangle update];
    [self._fallingTriangle update];
}

- (void)updateEventQueue
{
    __unsafe_unretained typeof(self._flashingTriangle) flashingTriangle = self._flashingTriangle;
    __unsafe_unretained typeof(self._fallingTriangle) fallingTriangle = self._fallingTriangle;
    [[EEventQueue sharedInstance] addObjectToEventQueue:[EEventObject initWithEventBlock:^{
        if (flashingTriangle.animationBlock) {
            flashingTriangle.animationBlock();
        }
        if (fallingTriangle.animationBlock) {
            fallingTriangle.animationBlock();
        }
    }]];
}

#pragma mark - Overridden properties

- (EFlashingTriangle *)_flashingTriangle
{
    if (!__flashingTriangle) {
        EPoint *triangleOrigin = [EPoint pointWithXComponent:240 yComponent:180];
        ETriangle *triangle = [ETriangle eqilateralTriangleCenteredAtPoint:triangleOrigin withSideLength:75.0];
        __flashingTriangle = [[EFlashingTriangle alloc] init];
        [__flashingTriangle setPoints:triangle.points];
    }
    return __flashingTriangle;
}

- (EFallingTriangle *)_fallingTriangle
{
    if (!__fallingTriangle) {
        ETriangle *triangle = [ETriangle eqilateralTriangleCenteredAtPoint:[EPoint zeroPoint] withSideLength:75.0];
        __fallingTriangle = [[EFallingTriangle alloc] init];
        __fallingTriangle.color = [EColor colorWithColor:[NSColor orangeColor]];
        __fallingTriangle.points = triangle.points;
        __fallingTriangle.mass = 100.0;
        __fallingTriangle.origin = [EPoint pointWithXComponent:165 yComponent:200];
        
        __unsafe_unretained EFallingTriangle *fallingTriange = __fallingTriangle;
        __fallingTriangle.animationBlock = ^{
            NSTimeInterval delta = [[EGame sharedInstance].ticker logicDelta];
            fallingTriange.origin.x += delta * 52;
        };
    }
    return __fallingTriangle;
}

@end
