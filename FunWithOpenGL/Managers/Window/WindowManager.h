//
//  Window.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "Manager.h"

@interface WindowManager : Manager

@property (nonatomic, weak) NSOpenGLView *view;

@property (nonatomic, assign, readonly) NSRect defaultFrame;
@property (nonatomic, assign, readonly) NSPoint frameOrigin;

@property (nonatomic, strong, readonly) ESize *size;
@property (nonatomic, strong, readonly) ESize *pixelSize;

+ (WindowManager *)sharedInstance;

@end
