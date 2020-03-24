//
//  ITS_FavoritesViewController.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book+CoreDataClass.h"
#import "ITS_BookTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "ITS_FavoritesViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITS_FavoritesViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,ITS_BookTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *bookTableView;
@property (nonatomic) NSMutableArray *bookArray;
@property (nonatomic) ITS_FavoritesViewModel *viewModel;

-(void) fetchData;
@end

NS_ASSUME_NONNULL_END
