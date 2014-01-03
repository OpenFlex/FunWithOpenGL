//
//
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "ETicker.h"

@implementation ETicker

- (void)logicWasUpdated
{
//    self.timeSinceLogicUpdate = NSTimeIntervalSince1970;
//    self.timeSinceLogicUpdate -= self.timeForLogicRefrence;
//    self.timeForLogicRefrence = NSTimeIntervalSince1970;
}

- (void)drawingWasCompleted
{
    self.timeSinceDrawUpdate = [[NSDate date] timeIntervalSince1970];
}

- (NSTimeInterval)delta
{
    self.timeForDisplayRefrence = [[NSDate date] timeIntervalSince1970];
    self.timeForDisplayRefrence -= self.timeSinceDrawUpdate;
    
    return self.timeForDisplayRefrence;
}

@end
