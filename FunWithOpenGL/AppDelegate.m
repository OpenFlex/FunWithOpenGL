//
//  FWOGLAppDelegate.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 12/31/13.
//  Copyright (c) 2013 Bordex. All rights reserved.
//

#import "AppDelegate.h"
#import "MainView.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self initializeWindow];
    [self initializeOpenGLView];
    [self.window setContentView:self.view];
    [self.window makeKeyAndOrderFront:self];
    
    [GameManager sharedInstance];
}

- (void)initializeWindow
{
    self.window = [[NSWindow alloc] initWithContentRect:[WindowManager sharedInstance].defaultFrame
                                              styleMask:(NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask)
                                                backing:NSBackingStoreBuffered
                                                  defer:YES];
    [self.window setTitle:@"FunWithOpenGL"];
    [self.window setShowsResizeIndicator:YES];
    [self.window setAcceptsMouseMovedEvents:YES];
    [self.window setFrameOrigin:[WindowManager sharedInstance].frameOrigin];
}

- (void)initializeOpenGLView
{
    NSOpenGLPixelFormatAttribute attributes[] = { NSOpenGLPFADoubleBuffer, 0 };
    NSOpenGLPixelFormat *pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes:attributes];
    
    self.view = [[MainView alloc] initWithFrame:[WindowManager sharedInstance].defaultFrame
                                    pixelFormat:pixelFormat];
    [self.view setWantsBestResolutionOpenGLSurface:YES];
    [self.view setWantsLayer:YES];
}

@end
