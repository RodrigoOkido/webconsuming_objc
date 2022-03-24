//
//  DetailCell.h
//  webAPIConsuming_objc
//
//  Created by Natália Brocca dos Santos on 22/03/22.
//

#ifndef DetailCell_h
#define DetailCell_h
#import <UIKit/UIKit.h>

@interface DetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageDetail;
@property (weak, nonatomic) IBOutlet UILabel *titleDetail;
@property (weak, nonatomic) IBOutlet UILabel *genders;
@property (weak, nonatomic) IBOutlet UILabel *ratingDetail;
@property (weak, nonatomic) IBOutlet UILabel *descriptionDetail;

- (void) configImage: (NSString *) url;

@end


#endif /* DetailCell_h */
