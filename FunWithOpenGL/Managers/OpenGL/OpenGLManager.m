//
//  OpenGLManager.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "OpenGLManager.h"

@interface OpenGLManager ()

@property (nonatomic, strong) EOrtho *projection;
@property (nonatomic, strong) EColor *clearColor;

@end

@implementation OpenGLManager

#pragma mark - Initialization

+ (OpenGLManager *)sharedInstance
{
    static OpenGLManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [OpenGLManager new];
    });
    return sharedInstance;
}

#pragma mark - Public methods

- (void)updateOrtho
{
    [self loadMatrixMode:GL_PROJECTION];
    glOrtho(self.projection.left,
            self.projection.right,
            self.projection.bottom,
            self.projection.top,
            self.projection.near,
            self.projection.far);
    [self loadMatrixMode:GL_MODELVIEW];
}

- (void)updateViewport
{
    glViewport(0,
               0,
               [WindowManager sharedInstance].pixelSize.height,
               [WindowManager sharedInstance].pixelSize.height);
}

- (void)clearBackground
{
    glClearColor(self.clearColor.red,
                 self.clearColor.green,
                 self.clearColor.blue,
                 self.clearColor.alpha);
    
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}

- (void)forceDrawing { glFlush(); }

#pragma mark - Private methods

- (void)loadMatrixMode:(GLenum)mode
{
    glMatrixMode(mode);
    glLoadIdentity();
}

#pragma mark - Overridden properties

- (EOrtho *)projection
{
    if (_projection == nil) {
        _projection = [[EOrtho alloc] initWithLeft:0
                                             right:[WindowManager sharedInstance].size.width
                                            bottom:0
                                               top:[WindowManager sharedInstance].size.height
                                              near:1
                                               far:-1];
    }
    return _projection;
}

- (EColor *)clearColor
{
    if (_clearColor == nil) {
        _clearColor = [[EColor alloc] initWithWhite:0.8
                                              alpha:1.0];
    }
    return _clearColor;
}

@end
