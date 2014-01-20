//
//  EColor.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EColor.h"

@implementation EColor

#pragma mark - Initialization

- (EColor *)initWithRed:(CGFloat)redValue
                  green:(CGFloat)greenValue
                   blue:(CGFloat)blueValue
                  alpha:(CGFloat)alphaValue
{
    if (self = [super init]) {
        self.red = redValue;
        self.green = greenValue;
        self.blue = blueValue;
        self.alpha = alphaValue;
    }
    return self;
}

- (EColor *)initWithWhite:(CGFloat)whiteValue
                    alpha:(CGFloat)alphaValue
{
    if (self = [self initWithRed:whiteValue
                           green:whiteValue
                            blue:whiteValue
                           alpha:alphaValue]) {
        
    }
    return self;
}

@end
