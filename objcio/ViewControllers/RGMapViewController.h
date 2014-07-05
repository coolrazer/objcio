//
//  RGMapViewController.h
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface RGMapViewController : UIViewController

@property(nonatomic, strong) NSString *annotationImagePath;
@property(nonatomic, strong) CLLocation *currentLocation;

- (void) updateAnnotationLocation:(CLLocation*) location;

@end
