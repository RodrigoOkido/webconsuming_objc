//
//  RequestMovieAPI_TMDB.h
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 23/03/22.
//

#ifndef RequestMovieAPI_TMDB_h
#define RequestMovieAPI_TMDB_h

@interface RequestMovieAPI_TMDB: NSObject

@property (nonatomic, strong) NSURL *requestPopularUrl;
@property (nonatomic, strong) NSURL *requestNowPlaying;

- (NSDictionary *) getPopularMovie;
- (NSDictionary *) getNowPlaying;

@end


#endif /* RequestMovieAPI_TMDB_h */
