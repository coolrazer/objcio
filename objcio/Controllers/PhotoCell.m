//
//  PhotoCell.m
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _photoTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 280, 21)];
        _photoTitleLabel.font = [UIFont systemFontOfSize:17.];
        _photoDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 32, 280, 21)];
        _photoDateLabel.font = [UIFont systemFontOfSize:13.];
        _photoDateLabel.textColor = [UIColor lightGrayColor];

        [self.contentView addSubview:_photoTitleLabel];
        [self.contentView addSubview:_photoDateLabel];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.photoTitleLabel.shadowColor = [UIColor darkGrayColor];
        self.photoTitleLabel.shadowOffset = CGSizeMake(3, 3);
    } else {
        self.photoTitleLabel.shadowColor = nil;
    }
}

@end
