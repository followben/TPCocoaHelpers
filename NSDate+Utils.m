//
//  NSDate+Utils.m
//  TPCocoaHelpers
//
//  Created by Ben Stovold on 14/10/2011.
//  Copyright 2011 Ben Stovold and Gavin Conway. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

- (NSString *)dateStringWithStyle:(NSDateFormatterStyle)style
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[NSLocale currentLocale]];
    }
    [dateFormatter setDateStyle:style];
    return [dateFormatter stringFromDate:self];
}

@end
