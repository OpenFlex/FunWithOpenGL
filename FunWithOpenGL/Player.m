//
//  Player.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/18/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "Player.h"

@implementation Player

#pragma mark - Event queue delegate

- (void)eventQueueWasUpdatedWithEvent:(EEventObject *)event
{
    switch (event.eventType) {
        case EVENT_MOUSE:
            self.origin = [(EMouseEvent *)event location];
            break;
        default:
            break;
    }
}

@end
