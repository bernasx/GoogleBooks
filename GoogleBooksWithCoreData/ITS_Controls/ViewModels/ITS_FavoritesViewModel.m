//
//  ITS_FavoritesViewModel.m
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_FavoritesViewModel.h"

@implementation ITS_FavoritesViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bookArray = [[NSMutableArray alloc] init];
        self.repository = [[ITS_Repository alloc] init];
    }
    return self;
}

- (NSMutableArray *)fetchFavoriteBooks{
    self.bookArray = [[NSMutableArray alloc] initWithArray:[self.repository fetchFavoritesFromCoreData]];
    return self.bookArray;
}

-(NSMutableArray *)deleteCell: (ITS_BookTableViewCell *) cell fromTableView: (UITableView *) bookTableView{
    
    //remove it from array
    NSIndexPath* pathOfTheCell = [bookTableView indexPathForCell:cell];
    [self.bookArray removeObjectAtIndex:pathOfTheCell.row];
    
    //insert to parent context because the tempcontext won't get saved
    [self.repository.coreDataManager.parentContext deleteObject:cell.book];
    [self.repository.coreDataManager saveContext];
    return self.bookArray;
}

@end
