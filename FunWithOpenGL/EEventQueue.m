//
//  EEventQueue.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "EEventQueue.h"
#import "ETicker.h"

@interface EEventQueue ()

@property (atomic, strong) NSMutableArray *eventQueue;
@property (atomic, strong) NSMutableSet *delegates;

@end

@implementation EEventQueue

@synthesize eventQueue = _eventQueue;
@synthesize delegates = _delegates;

#pragma mark - Singleton

+ (EEventQueue *)sharedInstance
{
    static EEventQueue *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EEventQueue new];
        sharedInstance.eventQueue = [NSMutableArray new];
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
    if ([self.eventQueue count] <= 0) return;
    
    [self.eventQueue enumerateObjectsWithOptions:(NSEnumerationReverse) usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self updateDelegatesWithEventObject:obj];
    }];
    
    [[EGame sharedInstance].ticker logicWasCompleted];
    
    self.eventQueue = [NSMutableArray new];
}

@end
