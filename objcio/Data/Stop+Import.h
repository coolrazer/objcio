//
//  Stop+Import.h
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "Stop.h"

@interface Stop (Import)

+ (void)importCSVComponents:(NSArray*)components intoContext:(NSManagedObjectContext*)context;

@end
