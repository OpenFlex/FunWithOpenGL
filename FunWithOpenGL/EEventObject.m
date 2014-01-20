//
//  EEventObject.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EEventObject.h"

@implementation EEventObject

+ (EEventObject *)initWithEventBlock:(EventBlock)block
{
    EEventObject *eventObject = [EEventObject new];
    eventObject.eventBlock = block;
    eventObject.eventType = EVENT_OBJECT;
    return eventObject;
}

@end
