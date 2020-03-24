//
//  ITS_BookTableViewCell.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book+CoreDataClass.h"
NS_ASSUME_NONNULL_BEGIN
@protocol ITS_BookTableViewCellDelegate;

@interface ITS_BookTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) Book *book;
@property (weak, nonatomic) id<ITS_BookTableViewCellDelegate> delegate;
@end

// 3. Definition of the delegate's interface
@protocol ITS_BookTableViewCellDelegate <NSObject>

- (void)didTapFavoriteOnCell:(ITS_BookTableViewCell*) cell;

@end

NS_ASSUME_NONNULL_END
