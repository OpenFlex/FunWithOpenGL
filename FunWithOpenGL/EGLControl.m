//
//  EGLControl.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "EGLControl.h"
#import <OpenGL/gl.h>

@implementation EGLControl

+ (EGLControl *)controlWithOperatingView:(NSView *)view
{
    EGLControl *control = [EGLControl new];
    [control setOperatingView:view];
    return control;
}

- (void)updateOrthographicProjectionWithDefault
{
    [self changeMatrixMode:GL_PROJECTION];
    glOrtho(0, NSWidth(self.operatingView.bounds), 0, NSHeight(self.operatingView.bounds), 1, -1);
	[self changeMatrixMode:GL_MODELVIEW];
}

- (void)changeMatrixMode:(GLenum)mode
{
    glMatrixMode(mode);
    glLoadIdentity();
}

- (void)updateViewport
{
    NSRect backingBounds = [self.operatingView convertRectToBacking:
                            [self.operatingView bounds]];
    GLsizei backingPixelWidth = (GLsizei)(backingBounds.size.width), backingPixelHeight = (GLsizei)(backingBounds.size.height);
    glViewport(0, 0, backingPixelWidth, backingPixelHeight);
//    glViewport(0, 0, NSWidth(self.operatingView.bounds), NSHeight(self.operatingView.bounds));
//    [self updateOrthographicProjectionWithDefault];
}

- (void)clearBackground
{
    glClearColor(self.clearColor.red, self.clearColor.green, self.clearColor.blue, self.clearColor.alpha);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
}

@end
