//
//  FWOGLView.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 12/31/13.
//  Copyright (c) 2013 Deloitte. All rights reserved.
//

#import "FWOGLView.h"
#import "ETriangle.h"
#import "EGLControl.h"
#import "ECursor.h"
#import "ETicker.h"
#import "FWOGLAppDelegate.h"
#import "EGame.h"
#import <OpenGL/gl.h>

@interface FWOGLView ()

@property (nonatomic, strong) EGLControl *glControl;
@property (nonatomic, strong) EObjectController *objectController;
@property (nonatomic, strong) ECursorShape *cursor;

@end

@implementation FWOGLView

#pragma mark - Initialization

- (id)initWithFrame:(NSRect)frameRect pixelFormat:(NSOpenGLPixelFormat *)format
{
    if (self = [super initWithFrame:frameRect pixelFormat:format]) {
        [NSCursor hide];
        self.glControl.readyToDraw = YES;
        [[EEventQueue sharedInstance] addDelegate:self];
    }
    return self;
}

- (BOOL)acceptsFirstResponder
{
    return YES;
}

#pragma mark - View lifecycle

- (void)drawRect:(NSRect)rect
{
    if (!self.glControl.readyToDraw)
        return;
    
    [[EEventQueue sharedInstance] addObjectToEventQueue:[EEventObject initWithEventBlock:^{
        [self setNeedsDisplay:YES];
    }]];
    
    [self.glControl updateViewport];
    [self.glControl updateOrthographicProjectionWithDefault];
    [self.glControl clearBackground];
    
    [self.objectController displayObjects];
    [self.objectController updateEventQueue];
    
    [self.cursor draw];
    
    glFlush();
}

#pragma mark - NSResponder event handling

- (void)mouseMoved:(NSEvent *)theEvent
{
    [self mouseEvent:theEvent];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    [self mouseEvent:theEvent];
}

- (void)mouseEvent:(NSEvent *)theEvent
{
    [ECursor setMouseShouldHide:[self.cursor.origin pointInRect:self.bounds]];
    [self.cursor setOrigin:[EPoint pointWithPoint:theEvent.locationInWindow]];
    if ([ECursor hidden] && [EGame sharedInstance].gameState == RUNNING) {
        [[EEventQueue sharedInstance] addObjectToEventQueue:[EEventObject initWithEventBlock:^{
            [self.cursor setOrigin:[EPoint pointWithPoint:theEvent.locationInWindow]];
            [self setNeedsDisplayInRect:NSMakeRect(self.cursor.origin.x, self.cursor.origin.y, 20, 20)];
        }]];
    }
}

- (void)keyDown:(NSEvent *)theEvent
{
    [[EGame sharedInstance] toggleGameState];
}

#pragma mark - Event queue delegate

- (void)eventQueueWasUpdatedWithEvent:(EEventObject *)event
{
    if (event.eventBlock) {
        event.eventBlock();
    }
}

#pragma mark - Overridden properties

- (EGLControl *)glControl
{
    if (_glControl == nil) {
        _glControl = [EGLControl controlWithOperatingView:self];
        [_glControl setClearColor:[EColor colorWithRed:0.2 green:0.2 blue:0.25 alpha:0.0]];
    }
    return _glControl;
}

- (EObjectController *)objectController
{
    return (!_objectController) ? _objectController = [EObjectController new] : _objectController;
}

- (ECursorShape *)cursor
{
    return (!_cursor) ? _cursor = [ECursorShape cursorShape] : _cursor;
}

@end
