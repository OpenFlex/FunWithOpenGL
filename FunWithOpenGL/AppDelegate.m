//
//  FWOGLAppDelegate.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 12/31/13.
//  Copyright (c) 2013 Deloitte. All rights reserved.
//

#import "AppDelegate.h"
#import "MainView.h"

static const NSRect windowSize = {{0, 0}, {480, 360}};

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self initializeWindow];
    [self initializeOpenGLView];
    [self.window setContentView:self.view];
    [self.window makeKeyAndOrderFront:self];
    
    [[EGame sharedInstance] initializeTimer];
}

- (void)initializeWindow
{
    self.window = [[NSWindow alloc] initWithContentRect:windowSize
                                              styleMask:(NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask)
                                                backing:NSBackingStoreBuffered defer:YES];
    [self.window setTitle:@"FunWithOpenGL"];
    [self.window setShowsResizeIndicator:YES];
    [self.window setAcceptsMouseMovedEvents:YES];
    [self.window setFrameOrigin:NSMakePoint((NSWidth([NSScreen mainScreen].frame) - NSWidth(windowSize)) / 2,
                                            (NSHeight([NSScreen mainScreen].frame) - NSHeight(windowSize)) / 2)];
}

- (void)initializeOpenGLView
{
    NSOpenGLPixelFormatAttribute attributes[] = { NSOpenGLPFADoubleBuffer, 0 };
    NSOpenGLPixelFormat *pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes:attributes];
    self.view = [[MainView alloc] initWithFrame:windowSize pixelFormat:pixelFormat];
    [self.view setWantsBestResolutionOpenGLSurface:YES];
    [self.view setWantsLayer:YES];
}

@end
