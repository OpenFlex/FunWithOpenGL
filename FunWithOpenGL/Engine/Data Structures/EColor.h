//
//  EColor.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EColor : NSObject

@property (nonatomic, assign) CGFloat red;
@property (nonatomic, assign) CGFloat green;
@property (nonatomic, assign) CGFloat blue;
@property (nonatomic, assign) CGFloat alpha;


- (EColor *)initWithRed:(CGFloat)redValue
                  green:(CGFloat)greenValue
                   blue:(CGFloat)blueValue
                  alpha:(CGFloat)alphaValue;

- (EColor *)initWithWhite:(CGFloat)whiteValue
                    alpha:(CGFloat)alphaValue;

@end
