//
//  ESize.m
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import "ESize.h"

@implementation ESize

- (ESize *)initWithWidth:(GLsizei)width height:(GLsizei)height
{
    if (self = [super init]) {
        self.width = width;
        self.height = height;
    }
    return self;
}

@end
