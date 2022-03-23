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
    
    cell.imageDetail.image = [UIImage systemImageNamed: @"moon"];
    cell.titleDetail.text = @"Sailor Moon";
    cell.genders.text = @"Ação, Aventura";
    cell.ratingDetail.text = @"9.2";
    cell.descriptionDetail.text = @"Sailor Moon é um anime que conta a hitória de Usagi, uma garota do colegial que um dia se torna uma super heroína com a ajuda de um gato preto misterioso.";
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



@end
