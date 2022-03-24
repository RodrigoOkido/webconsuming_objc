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


- (void) configImage:(NSString *)imageUrl {
    
    NSURL *url = [NSURL URLWithString: imageUrl];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        
        @try {
            NSData *data = [NSData dataWithContentsOfURL: url];
            UIImage *image = [UIImage imageWithData: data];
            dispatch_async(dispatch_get_main_queue(), ^(void){
                self.movieImage.image = image;
                self.movieImage.layer.cornerRadius = 10;
            });
        }
        @catch (id anException) {
            NSLog(@"Error");
        }
    });
}
    
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
