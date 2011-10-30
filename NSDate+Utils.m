//
//  NSDate+Utils.m
//  TPCocoaHelpers
//
//  Created by Ben Stovold on 14/10/2011.
//  Copyright 2011 Ben Stovold and Gavin Conway. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

- (NSDateFormatter *)staticDateFormatter
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[NSLocale currentLocale]];
    }
    return dateFormatter;
}

- (NSString *)dateStringWithStyle:(NSDateFormatterStyle)style
{
    NSDateFormatter *dateFormatter = [self staticDateFormatter];
    [dateFormatter setDateFormat:nil];
    [dateFormatter setDateStyle:style];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)dateStringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [self staticDateFormatter];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:self];
}

@end
