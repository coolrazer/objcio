//
//  AppDelegate.m
//  objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "AppDelegate.h"
#import "Store.h"
#import "ImportViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) Store* store;
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    ImportViewController* importViewController = [[ImportViewController alloc] init];
    self.store = [[Store alloc] init];
    importViewController.store = self.store;
    self.window.rootViewController = importViewController;
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillTerminate:(UIApplication *)application
{
    [self.store saveContext];
}

@end
