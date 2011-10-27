//
//  UIControl+Utils.m
//  TPCocoaHelpers
//
//  Created by Ben Stovold on 19/10/2011.
//  Copyright 2011 Ben Stovold and Gavin Conway. All rights reserved.
//

#import "UIControl+Utils.h"

@implementation UIControl (Utils)

- (BOOL)hasTarget:(NSObject *)target
{
    __block BOOL matchedTarget = NO;
    [[self allTargets] enumerateObjectsUsingBlock:^(NSObject *obj, BOOL *stop) {
        if ([obj isEqual:target]) matchedTarget = YES;
    }];
     
    return matchedTarget;
}

@end
