//
//  ReceiverProtocol.h
//  FunWithOpenGL
//
//  Created by Josh Grant on 1/19/14.
//  Copyright (c) 2014 Deloitte. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReceiverProtocol <NSObject>

- (void)updateWithEvent:(NSEvent *)event;

@end
