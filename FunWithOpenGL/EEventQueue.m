//
//  EEventQueue.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EEventQueue.h"
#import "ETicker.h"

@interface EEventQueue ()

@property (readwrite) NSMutableSet *eventQueue;
@property (strong) ETicker *ticker;

@end

static dispatch_source_t timerSource;

@implementation EEventQueue

#pragma mark - Singleton

+ (EEventQueue *)sharedInstance
{
    static EEventQueue *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EEventQueue new];
        sharedInstance.eventQueue = [NSMutableSet new];
        sharedInstance.delegates = [NSMutableSet new];
    });
    return sharedInstance;
}

#pragma mark - Public methods

- (void)addObjectToEventQueue:(id)object
{
    [self.eventQueue addObject:object];
}

- (void)removeObjectFromEventQueue:(id)object
{
    [self.eventQueue removeObject:object];
}

- (void)removeAllObjectsFromEventQueue
{
    [self.eventQueue removeAllObjects];
}

- (void)addDelegate:(id<EventQueueDelegate>)delegate
{
    [self.delegates addObject:delegate];
}

- (void)removeDelegate:(id<EventQueueDelegate>)delegate
{
    [self.delegates removeObject:delegate];
}

- (void)updateDelegates
{
    for (id <EventQueueDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:@selector(eventQueueWasUpdatedWithEvent:)]) {
            [delegate eventQueueWasUpdatedWithEvent:[NSObject new]];
        }
    }
}

#pragma mark - Tick method

- (void)initializeTimer
{
    timerSource = [self createDispatchTimerWithTimeInterval:10000000 leeway:1000 dispatchQueue:dispatch_get_main_queue() executionBlock:^{
        
        if ([self.eventQueue count] > 0) {
            [self updateDelegates];
            [self removeAllObjectsFromEventQueue];
        }
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

@end
