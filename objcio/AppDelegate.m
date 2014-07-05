//
//  AppDelegate.m
//  objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "AppDelegate.h"
#import "DownloadOperation.h"

@interface AppDelegate ()
@property (nonatomic, strong) NSOperationQueue* operationQueue;
@end

@implementation AppDelegate {
    DownloadOperation* downloadOperation;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.operationQueue = [[NSOperationQueue alloc] init];
    self.operationQueue.maxConcurrentOperationCount = 1;
    
    downloadOperation = [[DownloadOperation alloc] initWithURL:[NSURL URLWithString:@"http://ipv4.download.thinkbroadband.com/5MB.zip"]];
    
    [self.operationQueue addOperation:downloadOperation];
    [self.operationQueue addOperationWithBlock:^
     {
         NSLog(@"next operation");
     }];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 10, 300, 80);
    [self.window addSubview:button];
    [button setTitle:@"Cancel" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    
    downloadOperation.completionBlock = ^{
        button.enabled = NO;
    };
    
    UIProgressView* progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.progress = 0;
    progressView.frame = CGRectMake(0, 120, 320, 20);
    [self.window addSubview:progressView];
    
    downloadOperation.progressCallback = ^(float progress) {
        progressView.progress = progress;
    };
    
    return YES;
}

- (void)cancel:(id)sender {
    [downloadOperation cancel];
}
@end
