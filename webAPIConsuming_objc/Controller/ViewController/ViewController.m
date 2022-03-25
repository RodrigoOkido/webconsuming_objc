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
#import "DetailViewController.h"

@interface ViewController ()

@property NSArray *popular_movies;
@property NSArray *now_playing;
@property long sectionSelected;
@property long rowSelected;

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
        NSString* urlFinal = [NSString stringWithFormat:@"%@%@",@"https://image.tmdb.org/t/p/w500",_popular_movies[indexPath.row][@"poster_path"]];
        [cell configImage:urlFinal];
        cell.movieTitle.text = _popular_movies[indexPath.row][@"title"];
        cell.movieDescription.text = _popular_movies[indexPath.row][@"overview"];
        NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
        [fmt setNumberStyle:NSNumberFormatterDecimalStyle];
        [fmt setMaximumFractionDigits:2];
        [fmt setRoundingMode: NSNumberFormatterRoundUp];
        cell.movieRating.text = [fmt stringFromNumber: _popular_movies[indexPath.row][@"vote_average"]];
    } else {
        NSString* urlFinal = [NSString stringWithFormat:@"%@%@",@"https://image.tmdb.org/t/p/w500",_now_playing[indexPath.row][@"poster_path"]];
        [cell configImage:urlFinal];
        cell.movieTitle.text = _now_playing[indexPath.row][@"title"];
        cell.movieDescription.text = _now_playing[indexPath.row][@"overview"];
        NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
        [fmt setNumberStyle:NSNumberFormatterDecimalStyle];
        [fmt setMaximumFractionDigits:2];
        [fmt setRoundingMode: NSNumberFormatterRoundUp];
        cell.movieRating.text = [fmt stringFromNumber: _now_playing[indexPath.row][@"vote_average"]];//        cell.movieImage.image = [UIImage systemImageNamed: @"star"];
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 138;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"movieId"])
    {
        // Get reference to the destination view controller
        DetailViewController *detailvc = [segue destinationViewController];
        self.sectionSelected = _tableView.indexPathForSelectedRow.section;
        //[self.sectionSelected = [detailvc.tableView.indexPathForSelectedRow.section];
        if (self.sectionSelected == 0) {
            self.rowSelected = _tableView.indexPathForSelectedRow.row;
            MovieObject movie = initMovie();
            NSString* urlFinal = [NSString stringWithFormat:@"%@%@",@"https://image.tmdb.org/t/p/w500",_popular_movies[self.rowSelected][@"poster_path"]];
            movie.image = urlFinal;
            movie.movie_id = _popular_movies[self.rowSelected][@"id"];
            movie.title = _popular_movies[self.rowSelected][@"title"];
            movie.description = _popular_movies[self.rowSelected][@"overview"];
            NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
            [fmt setNumberStyle:NSNumberFormatterDecimalStyle];
            [fmt setMaximumFractionDigits:2];
            [fmt setRoundingMode: NSNumberFormatterRoundUp];
            movie.rating_average = [fmt stringFromNumber: _popular_movies[self.rowSelected][@"vote_average"]];
            detailvc.movie = movie;
        } else {
            self.rowSelected = _tableView.indexPathForSelectedRow.row;
            MovieObject movie = initMovie();
            NSString* urlFinal = [NSString stringWithFormat:@"%@%@",@"https://image.tmdb.org/t/p/w500",_now_playing[self.rowSelected][@"poster_path"]];
            movie.image = urlFinal;
            movie.movie_id = _now_playing[self.rowSelected][@"id"];
            movie.title = _now_playing[self.rowSelected][@"title"];
            movie.description = _now_playing[self.rowSelected][@"overview"];
            NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
            [fmt setNumberStyle:NSNumberFormatterDecimalStyle];
            [fmt setMaximumFractionDigits:2];
            [fmt setRoundingMode: NSNumberFormatterRoundUp];
            movie.rating_average = [fmt stringFromNumber: _now_playing[self.rowSelected][@"vote_average"]];
            detailvc.movie = movie;
        }
    }
}

@end
