//
//  EOrtho.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOrtho : NSObject

@property (nonatomic, assign) NSInteger left;
@property (nonatomic, assign) NSInteger right;
@property (nonatomic, assign) NSInteger bottom;
@property (nonatomic, assign) NSInteger top;
@property (nonatomic, assign) NSInteger near;
@property (nonatomic, assign) NSInteger far;

- (EOrtho *)initWithLeft:(NSInteger)left
                                   right:(NSInteger)right
                                  bottom:(NSInteger)bottom
                                     top:(NSInteger)top
                                    near:(NSInteger)near
                                     far:(NSInteger)far;

@end