//
//  RGLocationManager.h
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol RGlocationProtocol <NSObject>

- (void) locationController:(id) controller didUpdateLocation:(CLLocation*) location;
- (void) locationController:(id) controller didFailWithError:(NSError*) error;

@end

@interface RGLocationManager : NSObject <CLLocationManagerDelegate>

@property(nonatomic, weak) id<RGlocationProtocol> delegate;

- (void) startUpdatingLocation;
- (void) stopUpdatingLocation;

@end
