//
//  NSDate+Utils.h
//  TPCocoaHelpers
//
//  Created by Ben Stovold on 14/10/2011.
//  Copyright 2011 Ben Stovold and Gavin Conway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

- (NSString *)dateStringWithStyle:(NSDateFormatterStyle)style;
- (NSString *)dateStringWithFormat:(NSString *)format;

@end
