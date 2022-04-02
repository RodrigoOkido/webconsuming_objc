//
//  RequestMovieAPI_TMDB.m
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 23/03/22.
//

#import <Foundation/Foundation.h>
#import "RequestMovieAPI_TMDB.h"
#import "Movie.h"

@interface RequestMovieAPI_TMDB ()

@end

@implementation RequestMovieAPI_TMDB

- (id)init {
    self = [super init];
    return self;
}


/**
 Request data receiving a URL from TMDB API as argument and return the data serialized in JSON format.
 */
- (NSDictionary *) requestData: (NSURL *) url {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL: url];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", _requestPopularUrl, (long)[responseCode statusCode]);
        return nil;
    }
    
    return [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONReadingAllowFragments error: &error];
}


/**
 Request popular movies from TMDB API. It takes only the first page defined on the URL string.
 */
- (NSDictionary *) getPopularMovie {
    _requestPopularUrl = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/popular?api_key=3b3fe42086419ba7768f061008414e5b&page=1"];
    
   return [self requestData: _requestPopularUrl];
}


/**
 Request now playing movies from TMDB API. It takes only the first page defined on the URL string.
 */
- (NSDictionary *) getNowPlaying {
    _requestNowPlaying = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=3b3fe42086419ba7768f061008414e5b&page=1"];

    return [self requestData: _requestNowPlaying];
}


/**
 Request genre of a specific movie on its id.
 */
- (NSDictionary *) getGenres: (NSNumber *) movie_id {
    NSString* urlFinal = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@?api_key=3b3fe42086419ba7768f061008414e5b", movie_id];
    _requestGenre = [NSURL URLWithString: urlFinal];

    return [self requestData: _requestGenre];
}


@end
