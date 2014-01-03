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

@property (nonatomic, assign) BOOL readyToDraw;

@property (nonatomic, strong) EPoint *position;
@property (nonatomic, strong) ETriangle *triangle;
@property (nonatomic, strong) EPolygon *cursor;
@property (nonatomic, strong) EGLControl *glControl;

@property (nonatomic, strong) ETriangle *fallingTriangle;

@end

@implementation FWOGLView

- (id)initWithFrame:(NSRect)frameRect pixelFormat:(NSOpenGLPixelFormat *)format
{
    if (self = [super initWithFrame:frameRect pixelFormat:format]) {
        [NSCursor hide];
        self.readyToDraw = YES;
        [[EEventQueue sharedInstance] addDelegate:self];
    }
    return self;
}

- (void)drawRect:(NSRect)rect
{
    if (!self.readyToDraw)
        return;
    
    [[EEventQueue sharedInstance] addObjectToEventQueue:[EEventObject initWithEventBlock:^{
        [self.triangle setColor:[EColor randomColor]];
        CGFloat verticalDisplacement = -20 * [[EGame sharedInstance].ticker logicDelta];
        [self.fallingTriangle translateWithVector:[EVector vectorWithXComponent:0 yComponent:verticalDisplacement]];
        [self setNeedsDisplayInRect:NSMakeRect(self.triangle.origin.x, self.triangle.origin.y, 100, 100)];
    }]];
    
    [self.glControl updateViewport];
    [self.glControl updateOrthographicProjectionWithDefault];
    [self.glControl clearBackground];
    
    glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    [self.triangle draw];
    [self.fallingTriangle draw];
    [self.cursor setColor:[EColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0]];
    [self.cursor draw];
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
    [self.cursor setColor:[EColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [self.cursor draw];
    
    glFlush();
}

#pragma mark - Input handling

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
        [[EEventQueue sharedInstance] addObjectToEventQueue:[ECursorEventObject initWithEventBlock:^{
            [self.cursor setOrigin:[EPoint pointWithPoint:theEvent.locationInWindow]];
            [self setNeedsDisplayInRect:NSMakeRect(self.cursor.origin.x, self.cursor.origin.y, 20, 20)];
        }]];
    }
}

- (void)keyDown:(NSEvent *)theEvent
{
    [[EGame sharedInstance] toggleGameState];
}

#pragma mark - Overridden methods

- (BOOL)acceptsFirstResponder
{
    return YES;
}

#pragma mark - Event queue delegate

- (void)eventQueueWasUpdatedWithEvent:(EEventObject *)event
{
    if (event.eventBlock) {
        event.eventBlock();
    }
}

#pragma mark - Overridden properties

- (EPoint *)position
{
    return (!_position) ?
    _position = [EPoint pointWithXComponent:0 yComponent:0] :
    _position;
}

- (ETriangle *)triangle
{
    if (!_triangle) {
        EPoint *viewCenter = [EPoint pointWithXComponent:[EGeneralMath halvedWidthOfRect:self.bounds]
                                              yComponent:[EGeneralMath halvedHeightOfRect:self.bounds]];
        _triangle = [ETriangle eqilateralTriangleCenteredAtPoint:viewCenter withSideLength:75.0];
        [_triangle setColor:[EColor colorWithRed:0.1 green:0.8 blue:0.2 alpha:0.0]];
    }
    
    return _triangle;
}

- (ETriangle *)fallingTriangle
{
    if (!_fallingTriangle) {
        EPoint *viewCenter = [EPoint pointWithXComponent:190 yComponent:300];
        _fallingTriangle = [ETriangle eqilateralTriangleCenteredAtPoint:viewCenter withSideLength:20];
        [_fallingTriangle setColor:[EColor colorWithColor:[NSColor orangeColor]]];
    }
    return _fallingTriangle;
}

- (EPolygon *)cursor
{
    if (!_cursor) {
        _cursor = [EPolygon new];
        NSArray *points = @[[EPoint pointWithXComponent:0.0 yComponent:0.0],
                            [EPoint pointWithXComponent:0.0 yComponent:-17.0],
                            [EPoint pointWithXComponent:5.0 yComponent:-12.0],
                            [EPoint pointWithXComponent:12.0 yComponent:-12.0]];
        [_cursor setPoints:points];
        [_cursor setShape:POLYGON];
        [_cursor setColor:[EColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.0]];
    }
    return _cursor;
}

- (EGLControl *)glControl
{
    if (_glControl == nil) {
        _glControl = [EGLControl controlWithOperatingView:self];
        [_glControl setClearColor:[EColor colorWithRed:0.2 green:0.2 blue:0.25 alpha:0.0]];
    }
    return _glControl;
}

@end
