//
//  PhotoViewController.h
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;


@interface PhotoViewController : UIViewController

@property (nonatomic, strong) Photo *photo;

@property (retain, nonatomic) UILabel *authorLabel;
@property (retain, nonatomic) UILabel *photosTakenLabel;

@end
