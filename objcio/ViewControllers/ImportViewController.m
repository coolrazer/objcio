//
//  ImportViewController.m
//  objcio
//
//  Created by kuying on 14-7-5.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "ImportViewController.h"
#import "Store.h"
#import "ImportOperation.h"
#import "FetchedResultsTableDataSource.h"
#import "Stop.h"

@interface ImportViewController ()
@property (nonatomic, strong) NSOperationQueue* operationQueue;
@property (nonatomic, strong) FetchedResultsTableDataSource* dataSource;

@property (strong, nonatomic) UIButton *startButton;
@property (strong, nonatomic) UIButton *cancelButton;

@end


@implementation ImportViewController

- (id)init {
    self = [super init];
    if(self) {
        self.operationQueue = [[NSOperationQueue alloc] init];
        
        _progressIndicator = [[UIProgressView alloc] initWithFrame:CGRectMake(20, 20, 280, 2)];
        
        _startButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 110, 30)];
        [_startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_startButton setTitle:@"Start Import" forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(startImport:) forControlEvents:UIControlEventTouchUpInside];
        
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(190, 30, 110, 30)];
        [_cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 68, 320, 480)];
    }
    return self;
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_progressIndicator];
    [self.view addSubview:_startButton];
    [self.view addSubview:_cancelButton];
    [self.view addSubview:_tableView];
    
    NSFetchRequest* fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Stop"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    NSFetchedResultsController* fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.store.mainManagedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.dataSource = [[FetchedResultsTableDataSource alloc] initWithTableView:self.tableView fetchedResultsController:fetchedResultsController];
    self.dataSource.configureCellBlock = ^(UITableViewCell*  cell, Stop* item)
    {
        cell.textLabel.text = item.name;
    };
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}


- (void)startImport:(id)sender {
    self.progressIndicator.progress = 0;
    NSString* fileName = [[NSBundle mainBundle] pathForResource:@"stops" ofType:@"txt"];
    ImportOperation* operation = [[ImportOperation alloc] initWithStore:self.store fileName:fileName];
    operation.progressCallback = ^(float progress) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^
         {
             self.progressIndicator.progress = progress;
         }];
    };
    [self.operationQueue addOperation:operation];
}

- (void)cancel:(id)sender {
    [self.operationQueue cancelAllOperations];
}
@end
