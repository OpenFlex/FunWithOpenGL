//
//  ECursor.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "ECursor.h"

@implementation ECursor

+ (void)setMouseShouldHide:(BOOL)shouldHide
{
    static BOOL isHidden = YES;
    if (!isHidden && shouldHide) {
        [NSCursor hide];
        isHidden = YES;
    } else if (isHidden && !shouldHide) {
        [NSCursor unhide];
        isHidden = NO;
    }
}

@end
