//
//  ECursorShape.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "ECursorShape.h"
#import <OpenGL/gl.h>

@implementation ECursorShape

+ (ECursorShape *)cursorShape
{
    ECursorShape *cursorShape = [ECursorShape new];
    cursorShape.shape = POLYGON;

    NSArray *points = @[[EPoint pointWithXComponent:0.0 yComponent:0.0],
                        [EPoint pointWithXComponent:0.0 yComponent:-17.0],
                        [EPoint pointWithXComponent:5.0 yComponent:-12.0],
                        [EPoint pointWithXComponent:12.0 yComponent:-12.0]];
    
    [cursorShape setPoints:points];
    return cursorShape;
}

- (void)draw
{
    glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    [self setColor:[EColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0]];
    [super draw];
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
    [self setColor:[EColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0]];
    [super draw];
}

@end
