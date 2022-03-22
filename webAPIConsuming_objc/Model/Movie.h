//
//  Movie.h
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 22/03/22.
//

#ifndef Movie_h
#define Movie_h

@interface Movie : NSObject

@property NSNumber *movie_id;
@property NSString *title;
@property NSArray<NSNumber *> *genres;
@property NSString *description;
@property NSString *image;
@property NSNumber *rating_average;

@end

#endif /* Movie_h */
