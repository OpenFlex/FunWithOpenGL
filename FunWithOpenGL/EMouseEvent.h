//
//  EMouseEvent.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/18/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EEventObject.h"

@interface EMouseEvent : EEventObject

@property (nonatomic, strong) EPoint *location;

@end
