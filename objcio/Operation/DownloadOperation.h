//
//  DownloadOperation.h
//  objcio
//
//  Created by kuying on 14-7-6.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadOperation : NSOperation

- (id)initWithURL:(NSURL*)url;
@property (nonatomic, readonly) NSError* error;
@property (nonatomic, strong) NSData* data;
@property (nonatomic, copy) void (^progressCallback) (float);

@end
