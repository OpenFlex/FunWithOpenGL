//
//  ETicker.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETicker : NSObject

@property (nonatomic, assign) NSInteger preferredFPS;
@property (nonatomic, assign) NSInteger decidedFPS;

@property (nonatomic, assign) BOOL paused;

@property (nonatomic, assign) NSTimeInterval timeSinceLastDraw;
@property (nonatomic, assign) NSTimeInterval timeSinceLastLogic;

- (void)drawingWasCompleted;
- (void)logicWasCompleted;

- (NSTimeInterval)drawingDelta;
- (NSTimeInterval)logicDelta;

@end
