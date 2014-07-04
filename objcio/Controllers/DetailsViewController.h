//
//  DetailsViewController.h
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@protocol DetailsViewControllerDelegate

- (void)didSelectPhotoAttributeWithKey:(NSString *)key;

@end

@interface DetailsViewController : UITableViewController

@property (nonatomic, strong) Photo *photo;
@property (nonatomic, weak) id <DetailsViewControllerDelegate> delegate;

@end
