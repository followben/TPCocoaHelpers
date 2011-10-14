//
//  NSString+StringUtils.h
//  Notes
//
//  Created by Ben Stovold on 12/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

+ (NSUInteger)numberOfWordsInString:(NSString *)str;
+ (NSString *)generateUUID;

@end
