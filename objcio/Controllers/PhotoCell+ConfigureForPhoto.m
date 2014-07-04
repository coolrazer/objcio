//
//  PhotoCell+ConfigureForPhoto.m
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "PhotoCell+ConfigureForPhoto.h"
#import "Photo.h"

@implementation PhotoCell (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo
{
    self.photoTitleLabel.text = photo.name;
    self.photoDateLabel.text = [self.dateFormatter stringFromDate:photo.creationDate];
}

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormatter;
}

@end
