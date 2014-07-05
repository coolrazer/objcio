//
//  NSString+ParseCSV.m
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "NSString+ParseCSV.h"

@implementation NSString (ParseCSV)

- (NSArray*)csvComponents
{
    NSMutableArray* components = [NSMutableArray array];
    NSScanner* scanner = [NSScanner scannerWithString:self];
    NSString* quote = @"\"";
    NSString* separator = @",";
    NSString* result;
    while(![scanner isAtEnd]) {
        if([scanner scanString:quote intoString:NULL]) {
            [scanner scanUpToString:quote intoString:&result];
            [scanner scanString:quote intoString:NULL];
        } else {
            [scanner scanUpToString:separator intoString:&result];
        }
        [scanner scanString:separator intoString:NULL];
        [components addObject:result];
    }
    return components;
}

@end
