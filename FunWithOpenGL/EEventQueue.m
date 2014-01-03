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
@property (readwrite) NSMutableSet *delegates;

@end

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

- (void)updateDelegatesWithEventObject:(EEventObject *)eventObject
{
    for (id <EventQueueDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:@selector(eventQueueWasUpdatedWithEvent:)]) {
            [delegate eventQueueWasUpdatedWithEvent:eventObject];
        }
    }
}

- (void)update
{
    if ([self.eventQueue count] > 0) {
        for (int i = 0; i < self.eventQueue.count; i++) {
            EEventObject *object = [self.eventQueue anyObject];
            [self updateDelegatesWithEventObject:object];
            [self removeObjectFromEventQueue:object];
            i--;
        }
    }
}

@end
