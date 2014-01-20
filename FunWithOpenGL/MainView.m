//
//  FWOGLView.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 12/31/13.
//  Copyright (c) 2013 Bordex. All rights reserved.
//

#import "MainView.h"

@interface MainView ()

@property (nonatomic, assign) BOOL readyToDraw;

@end

@implementation MainView

#pragma mark - Initialization

- (id)initWithFrame:(NSRect)frameRect pixelFormat:(NSOpenGLPixelFormat *)format
{
    if (self = [super initWithFrame:frameRect pixelFormat:format]) {
        [OpenGLManager sharedInstance];
        [[WindowManager sharedInstance] setView:self];
        
        EPoint *origin = [[EPoint alloc] init];
        origin.x = 50;
        origin.y = 50;
        
        EObject *player = [[EObject alloc] init];
        player.origin = origin;
        [[InputManager sharedInstance] addKeyReceiver:player];
        
        [[ObjectManager sharedInstance] addObject:player];
        
        self.readyToDraw = YES;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)drawRect:(NSRect)dirtyRect
{
    if (!self.readyToDraw) return;
    
    [[OpenGLManager sharedInstance] updateViewport];
    [[OpenGLManager sharedInstance] updateOrtho];
    [[OpenGLManager sharedInstance] clearBackground];
    
    [[ObjectManager sharedInstance] updateObjects];
    
    [[OpenGLManager sharedInstance] forceDrawing];
}

#pragma mark - Input handling

- (void)mouseDown:(NSEvent *)theEvent { [[InputManager sharedInstance] addMouseEvent:theEvent]; }
- (void)mouseMoved:(NSEvent *)theEvent { [[InputManager sharedInstance] addMouseEvent:theEvent]; }
- (void)mouseDragged:(NSEvent *)theEvent { [[InputManager sharedInstance] addMouseEvent:theEvent]; }
- (void)mouseUp:(NSEvent *)theEvent { [[InputManager sharedInstance] addMouseEvent:theEvent]; }

- (void)keyDown:(NSEvent *)theEvent { [[InputManager sharedInstance] addKeyEvent:theEvent]; }
- (void)keyUp:(NSEvent *)theEvent { [[InputManager sharedInstance] addKeyEvent:theEvent]; }

#pragma mark - Overridden methods

- (BOOL)acceptsFirstResponder { return YES; }

@end
