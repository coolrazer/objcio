//
//  PhotoCell+ConfigureForPhoto.h
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "PhotoCell.h"
@class Photo;

@interface PhotoCell (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo;

@end
