//
//  EGLControl.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EGLControl : NSObject

@property (nonatomic, assign) BOOL readyToDraw;
@property (nonatomic, weak) NSView *operatingView;
@property (nonatomic, strong) EColor *clearColor;

+ (EGLControl *)controlWithOperatingView:(NSView *)view;

- (void)changeMatrixMode:(GLenum)mode;
- (void)updateViewport;
- (void)updateOrthographicProjectionWithDefault;
- (void)clearBackground;

@end
