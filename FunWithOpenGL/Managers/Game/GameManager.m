//
//  GameManager.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "GameManager.h"
#import "AppDelegate.h"

@implementation GameManager

#pragma mark - Initialization

+ (GameManager *)sharedInstance
{
    static GameManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GameManager alloc] init];
        [sharedInstance fireGameLoopDispatchTimer];
    });
    return sharedInstance;
}

#pragma mark - Private methods

- (void)gameLoop
{
    if ([[ETicker sharedInstance] tick]) {
        [[(AppDelegate *)[NSApplication sharedApplication].delegate view] drawRect:NSZeroRect];
    }
}

- (void)fireGameLoopDispatchTimer
{
    static dispatch_source_t timerSource;
    timerSource = [self createDispatchTimerWithTimeInterval:0
                                                     leeway:0
                                              dispatchQueue:dispatch_get_main_queue()
                                             executionBlock:^{
        [self gameLoop];
    }];
}

- (dispatch_source_t)createDispatchTimerWithTimeInterval:(uint64_t)interval
                                                  leeway:(uint64_t)leeway
                                           dispatchQueue:(dispatch_queue_t)queue
                                          executionBlock:(dispatch_block_t)block
{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    if (timer) {
        dispatch_source_set_timer(timer, 0, interval, leeway);
        dispatch_source_set_event_handler(timer, block);
        dispatch_resume(timer);
    }
    return timer;
}

@end
