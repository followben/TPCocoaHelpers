//
//  NSDate+Utils.m
//  Notes
//
//  Created by Ben Stovold on 14/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
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
