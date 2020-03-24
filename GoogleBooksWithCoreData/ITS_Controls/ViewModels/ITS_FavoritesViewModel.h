//
//  ITS_FavoritesViewModel.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITS_Repository.h"
#import "ITS_ServiceUtils.h"
#import "ITS_BookTableViewCell.h"
#import "Book+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface ITS_FavoritesViewModel : NSObject
@property (nonatomic) NSMutableArray *bookArray;
@property (nonatomic) ITS_Repository *repository;
- (NSMutableArray *)fetchFavoriteBooks;
-(NSMutableArray *)deleteCell: (ITS_BookTableViewCell *) cell fromTableView: (UITableView *) bookTableView;
@end

NS_ASSUME_NONNULL_END
