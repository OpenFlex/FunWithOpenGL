//
//  InputManager.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "InputManager.h"
#import "Transmitter.h"

@interface InputManager ()

@property (nonatomic, strong) Transmitter *keyboardManager;
@property (nonatomic, strong) Transmitter *mouseManager;

@end

@implementation InputManager

#pragma mark - Initialization

+ (InputManager *)sharedInstance
{
    static InputManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[InputManager alloc] init];
        sharedInstance.keyboardManager = [[Transmitter alloc] init];
        sharedInstance.mouseManager = [[Transmitter alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Public methods

- (void)addKeyReceiver:(id <ReceiverProtocol>)keyReceiver { [self.keyboardManager addReceiver:keyReceiver]; }
- (void)addMouseReceiver:(id <ReceiverProtocol>)mouseReceiver { [self.mouseManager addReceiver:mouseReceiver]; }
- (void)addKeyEvent:(NSEvent *)event { [self.keyboardManager addEvent:event]; }
- (void)addMouseEvent:(NSEvent *)event { [self.mouseManager addEvent:event]; }

@end
