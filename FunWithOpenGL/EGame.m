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

@property (nonatomic, strong) FWOGLView *view;

@end

static dispatch_source_t timerSource;

@implementation EGame

#pragma mark - Inititalization

+ (EGame *)sharedInstance
{
    static EGame *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EGame new];
        sharedInstance.gameState = RUNNING;
    });
    return sharedInstance;
}

#pragma mark - Utility methods

- (void)gameLoop
{
    if (self.gameState == RUNNING) {
        if (self.ticker.logicDelta > 1.0 / 60.0) {
            [[EEventQueue sharedInstance] update];
            [self.ticker logicWasCompleted];
        }
    } else {
        //NSLog(@"Paused");
        [self.ticker logicWasCompleted];
    }
    
    
}

- (void)toggleGameState
{
    if (self.gameState == RUNNING) {
        self.gameState = PAUSED;
    } else if (self.gameState == PAUSED) {
        self.gameState = RUNNING;
    }
}

#pragma mark - Tick method

- (void)initializeTimer
{
    NSInteger nanosecondFractional = 1000000000;
    timerSource = [self createDispatchTimerWithTimeInterval:0.01 * nanosecondFractional leeway: 0.01 * nanosecondFractional dispatchQueue:dispatch_get_main_queue() executionBlock:^{
        [self gameLoop];
    }];
    
    [self.ticker drawingWasCompleted];
    [self.ticker logicWasCompleted];
}

- (dispatch_source_t)createDispatchTimerWithTimeInterval:(uint64_t)interval leeway:(uint64_t)leeway dispatchQueue:(dispatch_queue_t)queue executionBlock:(dispatch_block_t)block
{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    if (timer) {
        dispatch_source_set_timer(timer, 0, interval, leeway);
        dispatch_source_set_event_handler(timer, block);
        dispatch_resume(timer);
    }
    return timer;
}

#pragma mark - Overridden properties

- (ETicker *)ticker
{
    return (!_ticker) ?
    _ticker = [ETicker new] :
    _ticker;
}


@end
