//
//  EObject.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EObject : NSObject <ReceiverProtocol>

@property (nonatomic, strong) EPoint *origin;
@property (nonatomic, strong) EPoint *velocity;
@property (nonatomic, strong) EPoint *acceleration;

- (void)update;

@end
