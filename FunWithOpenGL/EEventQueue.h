//
//  EEventQueue.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EventQueueDelegate <NSObject>

- (void)eventQueueWasUpdatedWithEvent:(id)event;

@end

@interface EEventQueue : NSMutableSet

@property (readonly) NSMutableSet *eventQueue;
@property (strong) NSMutableSet *delegates;

+ (EEventQueue *)sharedInstance;

- (void)addObjectToEventQueue:(id)object;
- (void)removeObjectFromEventQueue:(id)object;
- (void)removeAllObjectsFromEventQueue;

- (void)addDelegate:(id <EventQueueDelegate>)delegate;
- (void)removeDelegate:(id <EventQueueDelegate>)delegate;
- (void)updateDelegates;

- (void)initializeTimer;

@end
