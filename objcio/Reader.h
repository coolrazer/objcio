//
//  Reader.h
//  objcio
//
//  Created by kuying on 14-7-6.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reader : NSObject

- (id)initWithFileAtURL:(NSURL *)fileURL;

- (void)enumerateLinesWithBlock:(void (^)(NSUInteger lineNumber, NSString *line))block
              completionHandler:(void (^)(NSUInteger numberOfLines))completion;

@end
