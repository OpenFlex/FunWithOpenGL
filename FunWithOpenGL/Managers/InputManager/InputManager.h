//
//  InputManager.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "Manager.h"

@interface InputManager : Manager

+ (InputManager *)sharedInstance;

- (void)addKeyReceiver:(id <ReceiverProtocol>)keyReceiver;
- (void)addMouseReceiver:(id <ReceiverProtocol>)mouseReceiver;

- (void)addKeyEvent:(NSEvent *)event;
- (void)addMouseEvent:(NSEvent *)event;

@end
