//
//  RGMapAnnotation.h
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface RGMapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readwrite, assign) CLLocationCoordinate2D coordinate;

- (void) updateCoordinate:(CLLocationCoordinate2D) newCoordinate;
- (void) setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
