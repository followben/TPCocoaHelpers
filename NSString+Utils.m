//
//  NSString+StringUtils.m
//  Notes
//
//  Created by Ben Stovold on 12/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

+ (NSUInteger)numberOfWordsInString:(NSString *)str {
    __block NSUInteger count = 0;
    [str enumerateSubstringsInRange:NSMakeRange(0, [str length])
                            options:NSStringEnumerationByWords|NSStringEnumerationSubstringNotRequired
                         usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                             count++;
                         }];
    return count;
}

+ (NSString *)generateUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}

@end
