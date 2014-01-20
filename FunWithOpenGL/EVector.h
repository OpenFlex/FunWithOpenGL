//
//  Vector.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EPoint;

@interface EVector : NSObject

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat z;

+ (EVector *)vectorWithX:(CGFloat)xComponent y:(CGFloat)yComponent;
+ (EVector *)vectorWithX:(CGFloat)xComponent y:(CGFloat)yComponent z:(CGFloat)zComponent;

+ (EVector *)vectorWithPoint:(EPoint *)point;
+ (EVector *)vectorWithNSPoint:(NSPoint)point;

- (EVector *)addVector:(EVector *)vector;
- (EVector *)subtractVector:(EVector *)vector;
- (EVector *)multiplyVector:(EVector *)vector;
- (EVector *)multiplyVectorWithConstant:(CGFloat)constant;
- (EVector *)divideVector:(EVector *)vector;
- (EVector *)divideVectorByConstant:(CGFloat)constant;

- (void)changeVectorValuesWithPoint:(NSPoint)point;
- (void)changeVectorValuesWithX:(CGFloat)xComponent y:(CGFloat)yComponent z:(CGFloat)zComponent;

- (EVector *)vectorCopy;

@end
