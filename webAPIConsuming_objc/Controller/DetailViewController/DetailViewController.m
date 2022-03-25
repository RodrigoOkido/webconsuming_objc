//
//  DetailViewController.m
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 22/03/22.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"
#import "RequestMovieAPI_TMDB.h"
#import "DetailCell.h"

@interface DetailViewController ()


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = false;
    self.tableView.allowsSelectionDuringEditing = false;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    DetailCell *cell = (DetailCell *) [tableView dequeueReusableCellWithIdentifier:@"detail_movie_cell"];
    
    NSString* urlFinal = _movie.image;
    [cell configImage:urlFinal];
    cell.titleDetail.text = _movie.title;
    cell.genders.text = [self getGenders:_movie.movie_id];
    cell.ratingDetail.text = _movie.rating_average;
    cell.descriptionDetail.text = _movie.description;
    
    return cell;
}

- (NSString *)getGenders:(NSNumber *) movie_id {
    RequestMovieAPI_TMDB *req = [[RequestMovieAPI_TMDB alloc]init];
    NSDictionary *dict = [req getGenres:movie_id];
    NSArray *genreList = dict[@"genres"];
    NSString *finalGenres = @"";
    NSString* genreName;
    
    for (int i = 0; i < genreList.count; i++)
    {
        NSDictionary *genre = genreList[i];
        if (genreList.count == 1 || i == (genreList.count - 1)) {
            genreName = [NSString stringWithFormat:@"%@ ", genre[@"name"]];
        } else {
            genreName = [NSString stringWithFormat:@"%@, ", genre[@"name"]];
        }
        finalGenres = [finalGenres stringByAppendingString: genreName];
    }
    
    return finalGenres;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



@end
