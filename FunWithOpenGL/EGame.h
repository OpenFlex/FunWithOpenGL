//
//  EGame.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETicker.h"

typedef NS_ENUM(NSInteger, GameState) {
    RUNNING,
    PAUSED
};

@interface EGame : NSObject

@property (nonatomic, strong) ETicker *ticker;
@property (nonatomic, assign) GameState gameState;

@property (nonatomic, assign) CGFloat desiredFrameRate;

+ (EGame *)sharedInstance;

- (void)initializeTimer;
- (void)gameLoop;
- (void)toggleGameState;

@end
