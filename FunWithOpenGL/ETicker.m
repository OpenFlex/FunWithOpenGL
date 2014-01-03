//
//
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
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
    static NSTimeInterval delta;
    
    delta = [[NSDate date] timeIntervalSince1970];
    return delta - self.timeSinceLastLogic;
}

@end
