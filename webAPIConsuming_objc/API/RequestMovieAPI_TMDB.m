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


- (NSDictionary *) getPopularMovie {
    _requestPopularUrl = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/popular?api_key=3b3fe42086419ba7768f061008414e5b&page=1"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:_requestPopularUrl];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    if([responseCode statusCode] != 200){
//        NSLog(@"Error getting %@, HTTP status code %i", _requestPopularUrl, [responseCode statusCode]);
        return nil;
    }
    
    return [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONReadingAllowFragments error: &error];
}


- (NSDictionary *) getNowPlaying {
    _requestNowPlaying = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=3b3fe42086419ba7768f061008414e5b&page=1"];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:_requestNowPlaying];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    if([responseCode statusCode] != 200){
//        NSLog(@"Error getting %@, HTTP status code %i", _requestPopularUrl, [responseCode statusCode]);
        return nil;
    }
    
    return [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONReadingAllowFragments error: &error];
}


- (void) loadPopularMovies {
    NSDictionary *popular_movies = self.getPopularMovie;
    NSArray *movies = popular_movies[@"results"];
    NSArray<Movie *> *popMovies;
    for (int i = 0; i <= 1; i++) {
        MovieObject movie;
        movie.title = movies[i][@"title"];
        movie.description = movies[i][@"overview"];
    }
}

@end
