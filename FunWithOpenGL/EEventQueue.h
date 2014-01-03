//
//  EEventQueue.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EEventObject;

@protocol EventQueueDelegate <NSObject>

- (void)eventQueueWasUpdatedWithEvent:(EEventObject *)event;

@end

typedef void (^CompletionHandler)();

@interface EEventQueue : NSMutableSet

@property (strong, readonly) NSMutableSet *eventQueue;
@property (strong, readonly) NSMutableSet *delegates;

+ (EEventQueue *)sharedInstance;

- (void)addObjectToEventQueue:(id)object;
- (void)removeObjectFromEventQueue:(id)object;
- (void)removeAllObjectsFromEventQueue;

- (void)addDelegate:(id <EventQueueDelegate>)delegate;
- (void)removeDelegate:(id <EventQueueDelegate>)delegate;
- (void)updateDelegatesWithEventObject:(EEventObject *)eventObject;

- (void)update;

@end
