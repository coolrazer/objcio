//
//  NSData+EnumerateComponents.m
//  objcio
//
//  Created by kuying on 14-7-6.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "NSData+EnumerateComponents.h"

@implementation NSData (EnumerateComponents)

- (void)obj_enumerateComponentsSeparatedBy:(NSData*)delimiter usingBlock:(void (^)(NSData*, BOOL finalBlock) )block
{
    NSUInteger loc = 0;
    while (YES) {
        NSRange rangeOfNewline = [self rangeOfData:delimiter options:0 range:NSMakeRange(loc, self.length - loc)];
        if (rangeOfNewline.location == NSNotFound) {
            break;
        }
        
        NSRange rangeWithDelimiter = NSMakeRange(loc, rangeOfNewline.location - loc + delimiter.length);
        NSData *chunkWithDelimiter = [self subdataWithRange:rangeWithDelimiter];
        block(chunkWithDelimiter, NO);
        loc = NSMaxRange(rangeWithDelimiter);
    }
    NSData *remainder = [self subdataWithRange:NSMakeRange(loc, self.length - loc)];
    block(remainder, YES);
}

@end
