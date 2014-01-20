//
//  Window.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "WindowManager.h"

@interface WindowManager ()

@end

@implementation WindowManager

@synthesize frameOrigin = _frameOrigin;
@synthesize defaultFrame = _defaultFrame;
@synthesize size = _size;
@synthesize pixelSize = _pixelSize;

#pragma mark - Initialization

+ (WindowManager *)sharedInstance
{
    static WindowManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WindowManager new];
    });
    return sharedInstance;
}

#pragma mark - Overridden properties

- (NSRect)defaultFrame
{
    if (NSEqualRects(_defaultFrame, NSZeroRect)) {
        _defaultFrame = NSMakeRect(0, 0, 480, 360);
    }
    return _defaultFrame;
}

- (NSPoint)frameOrigin
{
    if (NSEqualPoints(_frameOrigin, NSZeroPoint)) {
        CGFloat screenWidth = NSWidth([NSScreen mainScreen].frame);
        CGFloat screenHeight = NSHeight([NSScreen mainScreen].frame);
        
        CGFloat windowWidth = NSWidth([WindowManager sharedInstance].defaultFrame);
        CGFloat windowHeight = NSHeight([WindowManager sharedInstance].defaultFrame);
        
        CGFloat originX = screenWidth - windowWidth / 2;
        CGFloat originY = screenHeight - windowHeight / 2;
        
        _frameOrigin = NSMakePoint(originX, originY);
    }
    return _frameOrigin;
}

- (ESize *)size
{
    if (_size == nil) {
        _size = [[ESize alloc] initWithWidth:NSWidth(self.view.bounds)
                                      height:NSHeight(self.view.bounds)];
    }
    return _size;
}

- (ESize *)pixelSize
{
    if (_pixelSize == NULL) {
        NSRect backingBounds = [self.view convertRectToBacking:self.view.bounds];
        _pixelSize = [[ESize alloc] initWithWidth:(GLsizei)(backingBounds.size.width)
                                           height:(GLsizei)(backingBounds.size.height)];
    }
    return _pixelSize;
}

@end
