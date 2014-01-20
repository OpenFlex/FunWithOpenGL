//
//  OpenGLManager.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "Manager.h"

@interface OpenGLManager : Manager

+ (OpenGLManager *)sharedInstance;

- (void)updateOrtho;
- (void)updateViewport;
- (void)clearBackground;

- (void)forceDrawing;

@end