//
//  ETicker.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "ETicker.h"

@interface ETicker ()

@property (nonatomic, assign) NSTimeInterval timePassed;
@property (nonatomic, assign) NSTimeInterval timeStep;

@end

@implementation ETicker

#pragma mark - Initialization

+ (ETicker *)sharedInstance
{
    static ETicker *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ETicker alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Public methods

- (BOOL)tick
{
    if (self.delta > self.timeStep) {
        self.delta = 0;
        self.timePassed = [NSDate timeIntervalSinceReferenceDate];
        
        return YES;
    }
    
    self.delta += [NSDate timeIntervalSinceReferenceDate] - self.timePassed;
    self.timePassed = [NSDate timeIntervalSinceReferenceDate];
    
    return NO;
}

#pragma mark - Overridden properties

- (NSTimeInterval)timePassed
{
    if (_timePassed == 0) {
        _timePassed = [NSDate timeIntervalSinceReferenceDate];
    }
    return _timePassed;
}

- (NSTimeInterval)timeStep
{
    if (_timeStep == 0) {
        _timeStep = 1;
    }
    return _timeStep;
}

@end
