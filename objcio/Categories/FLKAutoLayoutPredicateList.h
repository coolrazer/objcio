//
//  FLKAutoLayoutPredicateList.h
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+FLKAutoLayoutPredicate.h"

typedef NSLayoutConstraint* (^predicateBlock)(FLKAutoLayoutPredicate predicate);

@interface FLKAutoLayoutPredicateList : NSObject

+ (id)predicateListFromString:(NSString*)string;
- (NSArray*)iteratePredicatesUsingBlock:(predicateBlock)block;

@end
