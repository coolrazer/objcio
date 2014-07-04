//
//  PhotoViewController.m
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "PhotoViewController.h"
#import "Photo.h"
#import "User.h"
#import "DetailsViewController.h"
#import "DetailViewController.h"

@interface PhotoViewController () <DetailsViewControllerDelegate>

@property (retain, nonatomic) UILabel *authorTipLabel;
@property (retain, nonatomic) UILabel *photosTakenTipLabel;

@end

@implementation PhotoViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _authorTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 84, 280, 21)];
        _authorTipLabel.font = [UIFont systemFontOfSize:13];
        _authorTipLabel.textColor = [UIColor lightGrayColor];
        _authorTipLabel.text = @"Photo taken by";
        
        _authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 105, 280, 25)];
        _authorLabel.font = [UIFont systemFontOfSize:17];
        
        _photosTakenTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 134, 163, 16)];
        _photosTakenTipLabel.font = [UIFont systemFontOfSize:13];
        _photosTakenTipLabel.text = @"Number of photos taken:";
        
        _photosTakenLabel = [[UILabel alloc] initWithFrame:CGRectMake(192, 134, 32, 16)];
        _photosTakenLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_authorTipLabel];
    [self.view addSubview:_authorLabel];
    [self.view addSubview:_photosTakenTipLabel];
    [self.view addSubview:_photosTakenLabel];
    
    [self updateForPhoto];
    [self addPhotoDetailsTableView];
}

- (void)updateForPhoto
{
    self.navigationItem.title = self.photo.name;
    self.authorLabel.text = self.photo.authorFullName;
    self.photosTakenLabel.text = [NSString stringWithFormat:@"%d", self.photo.user.numberOfPhotosTaken];
}

- (void)addPhotoDetailsTableView
{
    DetailsViewController *details = [[DetailsViewController alloc] init];
    details.photo = self.photo;
    details.delegate = self;
    [self addChildViewController:details];
    CGRect frame = self.view.bounds;
    frame.origin.y = 180;
    frame.size.height = frame.size.height - 180;
    details.view.frame = frame;
    [self.view addSubview:details.view];
    [details didMoveToParentViewController:self];
}


#pragma mark OBJPhotoDetailsViewControllerDelegate

- (void)didSelectPhotoAttributeWithKey:(NSString *)key
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.key = key;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
