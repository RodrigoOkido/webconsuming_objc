//
//  ViewController.h
//  webAPIConsuming_objc
//
//  Created by Rodrigo Yukio Okido on 22/03/22.
//

#import <UIKit/UIKit.h>
#import "Movie.h"


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property NSArray<Movie *> *popular_movies;
@property NSArray<Movie *> *now_playing;
@property int itemSelected;
@property int rowSelected;

@end

