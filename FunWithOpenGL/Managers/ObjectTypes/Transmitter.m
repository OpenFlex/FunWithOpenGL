//
//  Transmitter.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "Transmitter.h"

@implementation Transmitter

@synthesize receivers = _receivers;
@synthesize eventBuffer = _eventBuffer;

#pragma mark - Public methods

- (void)addEvent:(NSEvent *)event
{
    [self.eventBuffer addObject:event];
    [self updateReceivers];
}

#pragma mark - Transmitter protocol

- (void)addReceiver:(id <ReceiverProtocol>)receiver
{
    [self.receivers addObject:receiver];
}

- (void)removeReceiver:(id <ReceiverProtocol>)receiver
{
    [self.receivers removeObject:receiver];
}

- (void)updateReceivers
{
    for (NSEvent *event in self.eventBuffer) {
        for (id <ReceiverProtocol> receiver in self.receivers) {
            [receiver updateWithEvent:event];
        }
    }
    
    [self.eventBuffer removeAllObjects];
}

#pragma mark - Overridden properties

- (NSMutableArray *)receivers
{
    if (_receivers == nil) {
        _receivers = [[NSMutableArray alloc] init];
    }
    return _receivers;
}

- (NSMutableArray *)eventBuffer
{
    if (_eventBuffer == nil) {
        _eventBuffer = [[NSMutableArray alloc] init];
    }
    return _eventBuffer;
}

@end
