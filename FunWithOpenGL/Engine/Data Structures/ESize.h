//
//  ESize.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESize : NSObject

- (ESize *)initWithWidth:(GLsizei)width height:(GLsizei)height;

@property (nonatomic, assign) GLsizei width;
@property (nonatomic, assign) GLsizei height;

@end
