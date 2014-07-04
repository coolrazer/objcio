//
//  ArrayDataSourceTests.m
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "PhotoDataTestCase.h"
#import "ArrayDataSource.h"

@interface ArrayDataSourceTests : PhotoDataTestCase
@end

@implementation ArrayDataSourceTests

- (void)testInitializing
{
    XCTAssertNil([[ArrayDataSource alloc] init], @"Should not be allowed.");
    
    id obj1 = [[ArrayDataSource alloc] initWithItems:@[] cellIdentifier:@"foo" configureCellBlock:^(UITableViewCell *a, id b){}];
    XCTAssertNotNil(obj1, @"");
}

- (void)testCellConfiguration
{
    __block UITableViewCell *configuredCell = nil;
    __block id configuredObject = nil;
    TableViewCellConfigureBlock block = ^(UITableViewCell *a, id b){
        configuredCell = a;
        configuredObject = b;
    };
    ArrayDataSource *dataSource = [[ArrayDataSource alloc] initWithItems:@[@"a", @"b"] cellIdentifier:@"foo" configureCellBlock:block];
    
    id mockTableView = [self autoVerifiedMockForClass:[UITableView class]];
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [[[mockTableView expect] andReturn:cell] dequeueReusableCellWithIdentifier:@"foo" forIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    id result = [dataSource tableView:mockTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    XCTAssertEqual(result, cell, @"Should return the dummy cell.");
    XCTAssertEqual(configuredCell, cell, @"This should have been passed to the block.");
    XCTAssertEqual(configuredObject, @"a", @"This should have been passed to the block.");
}

- (void)testNumberOfRows
{
    id mockTableView = [self autoVerifiedMockForClass:[UITableView class]];
    ArrayDataSource *dataSource = [[ArrayDataSource alloc] initWithItems:@[@"a", @"b"] cellIdentifier:@"foo" configureCellBlock:nil];
    XCTAssertEqual([dataSource tableView:mockTableView numberOfRowsInSection:0], (NSInteger) 2, @"");
}

@end
