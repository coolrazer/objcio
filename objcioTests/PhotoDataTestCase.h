//
//  PhotoDataTestCase.h
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>

@interface PhotoDataTestCase : XCTestCase

- (void)setUp NS_REQUIRES_SUPER;
- (void)tearDown NS_REQUIRES_SUPER;

/// Returns the URL for a resource that's been added to the test target.
- (NSURL *)URLForResource:(NSString *)name withExtension:(NSString *)extension;

/// Calls +[OCMockObject mockForClass:] and adds the mock and call -verify on it during -tearDown
- (id)autoVerifiedMockForClass:(Class)aClass;

/// C.f. -autoVerifiedMockForClass:
- (id)autoVerifiedPartialMockForObject:(id)object;

/// Calls -verify on the mock during -tearDown
- (void)verifyDuringTearDown:(id)mock;

@end
