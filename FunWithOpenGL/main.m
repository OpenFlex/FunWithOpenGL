//
//  main.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 12/31/13.
//  Copyright (c) 2013 Deloitte. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FWOGLAppDelegate.h"

int main(int argc, const char * argv[])
{
    [NSApplication sharedApplication];
    FWOGLAppDelegate *appDelegate = [[FWOGLAppDelegate alloc] init];
    [NSApp setDelegate:appDelegate];
    [NSApp run];
    
    return NSApplicationMain(argc, argv);
}
