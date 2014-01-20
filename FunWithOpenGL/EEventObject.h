//
//  EEventObject.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EventBlock)();
typedef NS_ENUM (NSInteger, EventType) {
    EVENT_MOUSE,
    EVENT_OBJECT
};

@interface EEventObject : NSObject

@property (copy) EventBlock eventBlock;
@property (nonatomic, assign) EventType eventType;

+ (EEventObject *)initWithEventBlock:(EventBlock)block;

//eventType:(EventType)eventType;

@end
