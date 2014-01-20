//
//  Transmitter.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transmitter : NSObject <TransmitterProtocol>

@property (nonatomic, strong) NSMutableArray *receivers;
@property (nonatomic, strong) NSMutableArray *eventBuffer;

- (void)addEvent:(NSEvent *)event;

@end
