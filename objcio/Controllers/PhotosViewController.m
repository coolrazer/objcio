//
//  PhotosViewController.m
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "PhotosViewController.h"
#import "Photo.h"
#import "PhotoCell.h"
#import "ArrayDataSource.h"
#import "Store.h"
#import "AppDelegate.h"
#import "PhotoCell+ConfigureForPhoto.h"
#import "PhotoViewController.h"

static NSString * const PhotoCellIdentifier = @"PhotoCell";

@interface PhotosViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;

@end

@implementation PhotosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Photos";
    [self setupTableView];
}

- (void)setupTableView
{
    TableViewCellConfigureBlock configureCell = ^(PhotoCell *cell, Photo *photo) {
        [cell configureForPhoto:photo];
    };
    NSArray *photos = [AppDelegate sharedDelegate].store.sortedPhotos;
    self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:photos
                                                         cellIdentifier:PhotoCellIdentifier
                                                     configureCellBlock:configureCell];
    self.tableView.dataSource = self.photosArrayDataSource;
    [self.tableView registerClass:[PhotoCell class] forCellReuseIdentifier:PhotoCellIdentifier];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoViewController *photoViewController = [[PhotoViewController alloc] init];
    photoViewController.photo = [self.photosArrayDataSource itemAtIndexPath:indexPath];
    [self.navigationController pushViewController:photoViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.;
}

@end
