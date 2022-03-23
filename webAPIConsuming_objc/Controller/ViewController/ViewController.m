//
//  ViewController.m
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 22/03/22.
//

#import "ViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import "RequestMovieAPI_TMDB.h"

@interface ViewController ()

@property NSArray *popular_movies;
@property NSArray *now_playing;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    RequestMovieAPI_TMDB *req = [[RequestMovieAPI_TMDB alloc] init];
    NSDictionary *pop = [req getPopularMovie];
    NSDictionary *now = [req getNowPlaying];
    _popular_movies = pop[@"results"];
    _now_playing = now[@"results"];
    
    
//    NSLog(@"%@", movies[1][@"title"]);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Popular Movies";
    } else {
        return @"Now Playing";
    }
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *) [tableView dequeueReusableCellWithIdentifier: @"movie_cell"];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if (indexPath.section == 0) {
        cell.movieTitle.text = _popular_movies[indexPath.row][@"title"];
        cell.movieDescription.text = _popular_movies[indexPath.row][@"overview"];
        cell.movieRating.text = [NSString stringWithFormat:@"%@", _popular_movies[indexPath.row][@"vote_average"]];
//        cell.movieImage.image = [UIImage systemImageNamed: @"star"];
    } else {
        cell.movieTitle.text = _now_playing[indexPath.row][@"title"];
        cell.movieDescription.text = _now_playing[indexPath.row][@"overview"];
        cell.movieRating.text = [NSString stringWithFormat:@"%@", _now_playing[indexPath.row][@"vote_average"]];
//        cell.movieImage.image = [UIImage systemImageNamed: @"star"];
    }
    
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else {
        return 10;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
