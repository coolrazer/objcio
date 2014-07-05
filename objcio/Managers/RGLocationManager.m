//
//  RGLocationManager.m
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "RGLocationManager.h"

@interface RGLocationManager ()

@property(nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation RGLocationManager

- (void) startUpdatingLocation
{
    [self.locationManager startUpdatingLocation];
}

- (void) stopUpdatingLocation
{
    if (_locationManager) {
        
        [_locationManager stopUpdatingLocation];
        _locationManager = nil;
    }
}

- (CLLocationManager*) locationManager
{
    if (!_locationManager) {
        _locationManager = [CLLocationManager new];
        _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        _locationManager.distanceFilter = 10.0f;
        _locationManager.delegate = self;
    }
    
    return _locationManager;
}

#pragma mark - Corelocation Delegate

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations objectAtIndex:0];
    
    [self.delegate locationController:self didUpdateLocation:location];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"didFailWithError: %@", error);
}

@end
