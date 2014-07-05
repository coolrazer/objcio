//
//  AppDelegate.m
//  objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "AppDelegate.h"
#import "RGContainerViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	RGContainerViewController *container = [RGContainerViewController new];
 	self.window.rootViewController = container;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
