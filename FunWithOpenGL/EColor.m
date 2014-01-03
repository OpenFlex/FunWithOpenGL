//
//  EColor.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/1/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EColor.h"

@implementation EColor

#pragma mark - Initialization

+ (EColor *)colorWithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue alpha:(CGFloat)alphaValue
{
    EColor *color = [EColor new];
    color.red = redValue;
    color.green = greenValue;
    color.blue = blueValue;
    color.alpha = alphaValue;
    return color;
}

+ (EColor *)unclampedColorWithRed:(CGFloat)redValue green:(CGFloat)greenValue blue:(CGFloat)blueValue alpha:(CGFloat)alphaValue
{
    return [EColor colorWithRed:redValue/255.0 green:greenValue/255.0 blue:blueValue/255.0 alpha:alphaValue/255.0];
}

+ (EColor *)randomColor
{
    return [EColor colorWithRed:[ERandom randomNumberBetweenZeroAndOne]
                          green:[ERandom randomNumberBetweenZeroAndOne]
                           blue:[ERandom randomNumberBetweenZeroAndOne]
                          alpha:[ERandom randomNumberBetweenZeroAndOne]];
}

+ (EColor *)colorWithColor:(NSColor *)color
{
    return [EColor colorWithRed:color.redComponent green:color.greenComponent blue:color.blueComponent alpha:color.alphaComponent];
}

#pragma mark - Overridden methods

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nRed:   %.2f\nGreen: %.2f\nBlue:  %.2f\nAlpha: %.2f\n", self.red, self.green, self.blue, self.alpha];
}

@end
