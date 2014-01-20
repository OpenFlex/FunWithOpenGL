//
//
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import "ETicker.h"

@implementation ETicker

- (void)drawingWasCompleted
{
    self.timeSinceLastDraw = [[NSDate date] timeIntervalSince1970];
}

- (void)logicWasCompleted
{
    self.timeSinceLastLogic = [[NSDate date] timeIntervalSince1970];
}

- (NSTimeInterval)drawingDelta
{
    static NSTimeInterval delta;
    
    delta = [[NSDate date] timeIntervalSince1970];
    return delta - self.timeSinceLastDraw;
}

- (NSTimeInterval)logicDelta
{
    static NSTimeInterval interval;
    static NSTimeInterval delta;
    
    interval = [[NSDate date] timeIntervalSince1970];
    delta = interval - self.timeSinceLastLogic;
    return (delta < 10000) ? delta : 0;
}

@end
