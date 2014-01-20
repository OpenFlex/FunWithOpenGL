//
//  FWOGLAppDelegate.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 12/31/13.
//  Copyright (c) 2013 Deloitte. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainView.h"
#import "EEventQueue.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong) NSWindow *window;
@property (strong) MainView *view;

@end
