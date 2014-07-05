//
//  ImportViewController.h
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Store;
@class FetchedResultsTableDataSource;

@interface ImportViewController : UIViewController

@property (nonatomic, strong) Store* store;
@property (strong, nonatomic) UIProgressView *progressIndicator;
@property (strong, nonatomic) UITableView *tableView;

- (void)startImport:(id)sender;
- (void)cancel:(id)sender;

@end
