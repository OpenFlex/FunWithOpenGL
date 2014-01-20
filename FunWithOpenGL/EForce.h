//
//  EForce.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EForce : NSObject

@property (nonatomic, assign) BOOL temporaryForce;
@property (nonatomic, assign) CGFloat magnitude;

@property (nonatomic, strong) EVector *direction;

+ (EForce *)forceWithMagnitude:(CGFloat)magnitude direction:(EVector *)direction temporary:(BOOL)temporary;

@end
