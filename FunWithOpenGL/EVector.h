//
//  Vector.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVector : NSObject

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat z;

+ (EVector *)vectorWithXComponent:(CGFloat)xComponent yComponent:(CGFloat)yComponent;
+ (EVector *)vectorWithXComponent:(CGFloat)xComponent yComponent:(CGFloat)yComponent zComponent:(CGFloat)zComponent;

+ (EVector *)vectorWithPoint:(NSPoint)point;

- (EVector *)addVector:(EVector *)vector;
- (EVector *)subtractVector:(EVector *)vector;
- (EVector *)multiplyVector:(EVector *)vector;

- (void)changeVectorValuesWithPoint:(NSPoint)point;
- (void)changeVectorValuesWithXComponent:(CGFloat)xComponent yComponent:(CGFloat)yComponent zComponent:(CGFloat)zComponent;

- (EVector *)vectorCopy;

@end
