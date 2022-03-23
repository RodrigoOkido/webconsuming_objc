//
//  Movie.h
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 22/03/22.
//

#ifndef Movie_h
#define Movie_h

typedef struct Movie {
    NSNumber *movie_id;
    NSString *title;
    NSArray<NSNumber *> *genres;
    NSString *description;
    NSString *image;
    NSNumber *rating_average;
} MovieObject;

@interface Movie : NSObject

@end

#endif /* Movie_h */
