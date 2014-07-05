//
//  RGMapAnnotation.m
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "RGMapAnnotation.h"

@implementation RGMapAnnotation

- (void) updateCoordinate:(CLLocationCoordinate2D) newCoordinate
{
    _coordinate = newCoordinate;
}

- (void) setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    _coordinate = newCoordinate;
}

@end
