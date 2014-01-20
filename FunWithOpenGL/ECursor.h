//
//  ECursor.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/2/14.
//  Copyright (c) 2014 Bordex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ECursor : NSObject

+ (void)setMouseShouldHide:(BOOL)shouldHide;
+ (BOOL)hidden;

@end
