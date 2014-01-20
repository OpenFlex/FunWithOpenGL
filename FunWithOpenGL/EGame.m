//
//  EGame.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EGame.h"
#import "MainView.h"
#import "AppDelegate.h"

@interface EGame ()

@property (nonatomic, strong) MainView *view;

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
        sharedInstance.desiredFrameRate = 800;
    });
    return sharedInstance;
}

#pragma mark - Utility methods

- (void)gameLoop
{
    if (self.gameState == RUNNING) {
        if (self.ticker.logicDelta > (1.0 / self.desiredFrameRate)) {
            [[EEventQueue sharedInstance] update];
        }
    } else if (self.gameState == PAUSED) {
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
    [self.ticker drawingWasCompleted];
    [self.ticker logicWasCompleted];
    
    timerSource = [self createDispatchTimerWithTimeInterval:0 leeway:0 dispatchQueue:dispatch_get_main_queue() executionBlock:^{
        [self gameLoop];
    }];
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
    return (!_ticker) ? _ticker = [ETicker new] : _ticker;
}

@end
