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

- (void) configImage:(NSString *)imageUrl {
    
    NSURL *url = [NSURL URLWithString: imageUrl];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        
        @try {
            NSData *data = [NSData dataWithContentsOfURL: url];
            UIImage *image = [UIImage imageWithData: data];
            dispatch_async(dispatch_get_main_queue(), ^(void){
                self.imageDetail.image = image;
                self.imageDetail.layer.cornerRadius = 10;
            });
        }
        @catch (id anException) {
            NSLog(@"Error");
        }
    });
}


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
