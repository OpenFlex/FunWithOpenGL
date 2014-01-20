//
//  EInput.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/3/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSInteger, InputEvent) {
    MOUSE_MOVE,
    MOUSE_DOWN,
    MOUSE_UP,
    MOUSE_DRAG,
    MOUSE_ENTER,
    MOUSE_EXIT,
    KEY_DOWN,
    KEY_UP
};

@interface EInput : NSResponder

@end
