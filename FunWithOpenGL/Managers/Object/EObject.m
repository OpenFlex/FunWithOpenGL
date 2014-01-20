//
//  EObject.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "EObject.h"

@implementation EObject

#pragma mark - Public methods

- (void)update
{
    [self display];
}

#pragma mark - Private methods

- (void)display
{
    glColor3f(1, 0, 0);
    glBegin(GL_QUADS);
    {
        glVertex2f(self.origin.x, self.origin.y);
        glVertex2f(self.origin.x + 100, self.origin.y);
        glVertex2f(self.origin.x + 100, self.origin.y + 100);
        glVertex2f(self.origin.x, self.origin.y + 100);
    }
    glEnd();
}

#pragma mark - Receiver protocol

- (void)updateWithEvent:(NSEvent *)event
{
    switch (event.type) {
        case NSKeyDown:
            switch (event.keyCode) {
                case 0:
                    self.origin.x -= 1 * [ETicker sharedInstance].delta;
                    NSLog(@"%f", self.origin.x);
                    break;
                case 2:
                    self.origin.x += 1 * [ETicker sharedInstance].delta;
                    NSLog(@"%f", self.origin.x);
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}

@end
