//
//  FWOGLView.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 12/31/13.
//  Copyright (c) 2013 Deloitte. All rights reserved.
//

#import "MainView.h"
#import "ETriangle.h"
#import "EGLControl.h"
#import "ECursor.h"
#import "ETicker.h"
#import "AppDelegate.h"
#import "EGame.h"
#import <OpenGL/gl.h>

#import "Level1.h"

@interface MainView ()

@property (nonatomic, strong) EGLControl *glControl;
//@property (nonatomic, strong) EObjectController *objectController;
@property (nonatomic, strong) ECursorShape *cursor;

@property (nonatomic, strong) Level1 *level1;

@end

@implementation MainView

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
    
    //glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    
//    [self.objectController displayObjects];
//    [self.objectController updateEventQueue];
    
    [self.level1 update];
    [self.cursor update];
    
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
        EMouseEvent *event = [[EMouseEvent alloc] init];
        [event setLocation:[EPoint pointWithPoint:theEvent.locationInWindow]];
        
        NSLog(@"%u", (unsigned)event.eventType);
        
        [[EEventQueue sharedInstance] addObjectToEventQueue:event];
    }
}

- (void)keyDown:(NSEvent *)theEvent
{
    NSLog(@"%@", theEvent);
    
    switch (theEvent.keyCode) {
        case 13: case 126:
            
            break;
        case 0: case 123:
            break;
        case 1: case 125:
            break;
        case 2: case 124:
            break;
            
        default:
            break;
    }
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

- (ECursorShape *)cursor
{
    return (!_cursor) ? _cursor = [ECursorShape cursorShape] : _cursor;
}

- (Level1 *)level1
{
    if (_level1 == nil) {
        _level1 = [[Level1 alloc] init];
    }
    return _level1;
}

@end
