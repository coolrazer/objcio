//
//  Store.h
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

+ (instancetype)store;

@property (readonly, nonatomic, strong) NSArray* photos;
@property (readonly, nonatomic, strong) NSArray* users;

- (NSArray*)sortedPhotos;

@end
