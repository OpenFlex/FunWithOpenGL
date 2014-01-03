//
//  EGeneralMath.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EGeneralMath.h"

@implementation EGeneralMath

+ (CGFloat)halvedHeightOfRect:(NSRect)rect
{
    return NSHeight(rect) / 2;
}

+ (CGFloat)halvedWidthOfRect:(NSRect)rect
{
    return NSWidth(rect) / 2;
}

@end
