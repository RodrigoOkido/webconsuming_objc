//
//  DetailCell.m
//  webAPIConsuming_objc
//
//  Created by Natália Brocca dos Santos on 22/03/22.
//

#import <Foundation/Foundation.h>
#import "DetailCell.h"

@interface DetailCell ()

@end

@implementation DetailCell

- (void)prepareForReuse {
    [super prepareForReuse];
    _imageDetail.image = nil;
    _titleDetail.text = @"Movie Name";
    _genders.text = @"";
    _ratingDetail.text = @"";
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
