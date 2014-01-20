//
//  EMouseEvent.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/18/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "EMouseEvent.h"

@implementation EMouseEvent

- (id)init
{
    if (self = [super init]) {
        self.eventType = EVENT_MOUSE;
    }
    return self;
}

+ (EEventObject *)initWithEventBlock:(EventBlock)block
{
    EEventObject *object = [super initWithEventBlock:block];
    [object setEventType:EVENT_MOUSE];
    return object;
}

@end
