//
//  FWOGLView.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 12/31/13.
//  Copyright (c) 2013 Deloitte. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "EEventQueue.h"

@class AppDelegate;

@interface MainView : NSOpenGLView <EventQueueDelegate>

@end
