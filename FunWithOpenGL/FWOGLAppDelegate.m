//
//  FWOGLAppDelegate.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 12/31/13.
//  Copyright (c) 2013 Deloitte. All rights reserved.
//

#import "FWOGLAppDelegate.h"
#import "FWOGLView.h"

static const NSRect windowSize = {{0, 0}, {480, 360}};

@implementation FWOGLAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self initializeWindow];
    [self initializeOpenGLView];
    [self initializeEventQueue];
    [self.window setContentView:self.view];
    [self.window makeKeyAndOrderFront:self];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        while (true) {
            if ([self.eventQueue count] > 0) {
                [self.view setNeedsDisplay:YES];
                [self.eventQueue removeAllObjects];
            }
        }
    });
}

- (void)initializeWindow
{
    self.window = [[NSWindow alloc] initWithContentRect:windowSize
                                              styleMask:(NSTitledWindowMask)
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
    self.view = [[FWOGLView alloc] initWithFrame:windowSize pixelFormat:pixelFormat];
    [self.view setWantsBestResolutionOpenGLSurface:YES];
    [self.view setWantsLayer:YES];
}

- (void)initializeEventQueue
{
    self.eventQueue = [NSMutableSet new];
}

@end
