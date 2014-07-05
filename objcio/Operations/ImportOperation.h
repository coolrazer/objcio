//
//  ImportOperation.h
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Store;

@interface ImportOperation : NSOperation

- (id)initWithStore:(Store*)store fileName:(NSString*)name;
@property (nonatomic) float progress;
@property (nonatomic, copy) void (^progressCallback) (float);

@end
