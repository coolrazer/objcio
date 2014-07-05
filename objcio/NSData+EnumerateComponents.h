//
//  NSData+EnumerateComponents.h
//  objcio
//
//  Created by kuying on 14-7-6.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (EnumerateComponents)

- (void)obj_enumerateComponentsSeparatedBy:(NSData*)delimiter usingBlock:(void (^)(NSData*, BOOL finalBlock) )block;

@end
