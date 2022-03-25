//
//  Movie.m
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 22/03/22.
//

#import <Foundation/Foundation.h>
#import "Movie.h"


@implementation Movie

MovieObject initMovie () {
    MovieObject movie;
    movie.title = @"";
    movie.description = @"";
    movie.rating_average = [NSString stringWithFormat:@""];

    return movie;
}

@end


