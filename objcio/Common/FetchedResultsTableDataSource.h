//
//  FetchedResultsTableDataSource.h
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void (^ConfigureBlock)(id cell, id item);

@interface FetchedResultsTableDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, copy) ConfigureBlock configureCellBlock;

- (id)initWithTableView:(UITableView*)aTableView fetchedResultsController:(NSFetchedResultsController*)aFetchedResultsController;
- (void)changePredicate:(NSPredicate*)predicate;
- (id)selectedItem;

@end
