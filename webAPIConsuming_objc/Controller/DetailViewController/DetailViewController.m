//
//  DetailViewController.m
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 22/03/22.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"
#import "DetailCell.h"

@interface DetailViewController ()


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    DetailCell *cell = (DetailCell *) [tableView dequeueReusableCellWithIdentifier:@"detail_movie_cell"];
    
    NSString* urlFinal = _movie.image;
    [cell configImage:urlFinal];
    cell.titleDetail.text = _movie.title;
    cell.genders.text = @"Ação, Aventura";
    cell.ratingDetail.text = _movie.rating_average;
    cell.descriptionDetail.text = _movie.description;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



@end
