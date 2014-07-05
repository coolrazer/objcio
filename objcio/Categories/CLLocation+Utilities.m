//
//  CLLocation+Utilities.m
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "CLLocation+Utilities.h"

@implementation CLLocation (Utilities)

- (CLLocation*) antipode
{
    CLLocationDegrees newLatitude;
    CLLocationDegrees newLongitude;
    
    double longitudeCorrection = -180.0;
    
    if (self.coordinate.longitude < 0.0)
        longitudeCorrection *= -1.0;
    
    newLatitude = self.coordinate.latitude * -1.0f;
    newLongitude = self.coordinate.longitude + longitudeCorrection;
    
    CLLocation *antipodeLocation = [[CLLocation alloc] initWithLatitude:newLatitude longitude:newLongitude];
    
    return antipodeLocation;
}

@end
