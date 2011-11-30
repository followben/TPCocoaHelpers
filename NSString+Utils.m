//
//  NSString+StringUtils.m
//  TPCocoaHelpers
//
//  Created by Ben Stovold on 12/10/2011.
//  Copyright 2011 Ben Stovold and Gavin Conway. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)


#pragma mark - Class methods

+ (NSString *)stringFromCFUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef uuidString = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    NSString *uuid = [[NSString alloc] initWithString:(__bridge NSString *)uuidString];
    CFRelease(uuidString);
    return uuid;
}


#pragma mark - Instance methods

- (NSUInteger)countWords {
    __block NSUInteger count = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByWords|NSStringEnumerationSubstringNotRequired
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              count++;
                          }];
    return count;
}

- (NSString *)stringByDeletingFromStringToFit:(CGRect)rect withInset:(CGFloat)inset usingFont:(UIFont *)font byWords:(BOOL)words
{
    NSString *result = [self copy];
    CGSize maxSize = CGSizeMake(rect.size.width  - (inset * 2), FLT_MAX);
    CGSize size = [result sizeWithFont:font
                     constrainedToSize:maxSize
                         lineBreakMode:UILineBreakModeWordWrap];
    
    unichar ellipsis = 0x2026;
    NSString *resultToCompare = nil;
    
    if (rect.size.height < size.height) {
        
        NSRange range = { .location = 0, .length = 0 };
        
        while (rect.size.height < size.height) {
            
            range = [result rangeOfString:@" " options:NSBackwardsSearch];
            
            if (range.location != NSNotFound && range.location > 0 && words) {
                result = [result substringToIndex:range.location];
            } else {
                result = [result substringToIndex:result.length - 1];
            }
            
            resultToCompare = [result stringByAppendingFormat:@"%C", ellipsis];
            size = [resultToCompare sizeWithFont:font
                               constrainedToSize:maxSize
                                   lineBreakMode:UILineBreakModeWordWrap];
        }
        
        result = [result stringByAppendingFormat:@"%C", ellipsis];
    }
    
    return result;
}
- (NSString *)stringByDeletingCharactersFromStringToFit:(CGRect)rect withInset:(CGFloat)inset usingFont:(UIFont *)font
{
    return [self stringByDeletingFromStringToFit:rect withInset:inset usingFont:font byWords:NO];
}

- (NSString *)stringByDeletingWordsFromStringToFit:(CGRect)rect withInset:(CGFloat)inset usingFont:(UIFont *)font
{
    return [self stringByDeletingFromStringToFit:rect withInset:inset usingFont:font byWords:YES];
}

- (NSString *)stringByInsertingNewLineBeforeWordExceedingIndex:(NSUInteger)index
{
    NSMutableString *string = [NSMutableString stringWithString:self];
    
    // Remove the last space in the first line (if there is one)
    NSString *firstLineText = [string substringToIndex:index];
    NSRange rangeOfLastSpaceInFirstLine = [firstLineText rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet] options:NSBackwardsSearch];
    
    if (rangeOfLastSpaceInFirstLine.location == NSNotFound) {
        [string insertString:@"\n" atIndex:index];
    } else {
        [string replaceOccurrencesOfString:@" " withString:@"\n" options:NSBackwardsSearch range:rangeOfLastSpaceInFirstLine];
    }
    return string;
}

@end
