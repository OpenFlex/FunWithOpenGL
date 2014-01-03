//
//  EEventObject.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EventBlock)();

@interface EEventObject : NSObject

@property (copy) EventBlock eventBlock;

+ (EEventObject *)initWithEventBlock:(EventBlock)block;

@end
