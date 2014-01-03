//
//  EGame.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EGame.h"
#import "FWOGLView.h"
#import "FWOGLAppDelegate.h"

@interface EGame ()

@property (atomic, assign) BOOL running;
@property (nonatomic, strong) FWOGLView *view;

@end

@implementation EGame

#pragma mark - Inititalization

- (id)init
{
    if (self = [super init]) {
        self.running = YES;
//        self.view = [[FWOGLView alloc] initWithFrame:NSMakeRect(0, 0, 480, 360)];
//        ((FWOGLAppDelegate *)[NSApplication sharedApplication]).window
    }
    return self;
}

#pragma mark - Utility methods

- (void)gameLoop
{
    while (self.running) {
        //NSLog(@"Hello!");
        //[self.view drawRect:NSMakeRect(0, 0, 480, 360)];
    }
}

- (void)setGameState:(GameState)state
{
    switch (state) {
        case RUNNING:
            self.running = YES;
            break;
        case PAUSED:
            self.running = NO;
            break;
    }
}

@end
