//
//  ETicker.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETicker : NSObject

@property (nonatomic, assign) NSTimeInterval delta;
@property (nonatomic, assign) CGFloat deltaModifier;

+ (ETicker *)sharedInstance;

- (BOOL)tick;

@end
