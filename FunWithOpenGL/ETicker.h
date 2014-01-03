//
//  ETicker.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETicker : NSObject

@property (nonatomic, assign) NSInteger preferredFPS;
@property (nonatomic, assign) NSInteger decidedFPS;

@property (nonatomic, assign) BOOL paused;

@property (nonatomic, assign) NSTimeInterval timeForLogicRefrence;
@property (nonatomic, assign) NSTimeInterval timeForDisplayRefrence;

@property (nonatomic, assign) NSTimeInterval timeSinceLogicUpdate;
@property (nonatomic, assign) NSTimeInterval timeSinceDrawUpdate;

- (void)logicWasUpdated;
- (void)drawingWasCompleted;

- (NSTimeInterval)delta;

@end
