//
//  EGame.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GameState) {
    RUNNING,
    PAUSED
};

@interface EGame : NSObject

- (void)gameLoop;
- (void)setGameState:(GameState)state;

@end
