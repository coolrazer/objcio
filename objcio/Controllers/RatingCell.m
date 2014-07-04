//
//  RatingCell.m
//  Objcio
//
//  Created by kuying on 14-7-4.
//  Copyright (c) 2014年 库颖. All rights reserved.
//

#import "RatingCell.h"

static const int MaximumNumberOfStars = 5;
static const float InactiveStarOpacity = .2;

@implementation RatingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        for (int i = 0; i < MaximumNumberOfStars; i++) {
            UIImageView *star = [[UIImageView alloc] initWithFrame:CGRectMake(68 + i * 38, 6, 32, 32)];
            star.image = [UIImage imageNamed:@"star"];
            [self.contentView addSubview:star];
        }
    }
    return self;
}

- (void)setRating:(double)rating
{
    if (_rating == rating) return;
    
    _rating = rating;
    [self updateForRating:rating];
}

- (void)updateForRating:(double)rating
{
    NSUInteger numberOfStars = (NSUInteger) ceilf((float) (rating * MaximumNumberOfStars));
    for (NSUInteger idx = 0; idx < MaximumNumberOfStars; idx++) {
        UIView *starView = self.contentView.subviews[idx];
        starView.alpha = numberOfStars > idx ? 1 : InactiveStarOpacity;
    }
}
@end
