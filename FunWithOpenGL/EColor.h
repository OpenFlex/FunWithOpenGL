//
//  EColor.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EColor : NSObject

@property (nonatomic, assign) CGFloat red;
@property (nonatomic, assign) CGFloat green;
@property (nonatomic, assign) CGFloat blue;
@property (nonatomic, assign) CGFloat alpha;

+ (EColor *)colorWithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue alpha:(CGFloat)alphaValue;
+ (EColor *)unclampedColorWithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue alpha:(CGFloat)alphaValue;
+ (EColor *)randomColor;
+ (EColor *)colorWithColor:(NSColor *)color;

@end
