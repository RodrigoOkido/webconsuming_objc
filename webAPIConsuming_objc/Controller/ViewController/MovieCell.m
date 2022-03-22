//
//  MovieCell.m
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 22/03/22.
//

#import <Foundation/Foundation.h>
#import "MovieCell.h"

@interface MovieCell ()
    
@end

@implementation MovieCell
    
- (void)prepareForReuse {
    [super prepareForReuse];
    _movieImage.image = nil;
    _movieTitle.text = @"Movie Name";
    _movieDescription.text = @"";
    _movieRating.text = @"";
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
