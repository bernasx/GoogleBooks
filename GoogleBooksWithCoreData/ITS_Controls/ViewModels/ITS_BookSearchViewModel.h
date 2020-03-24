//
//  ITS_BookSearchViewModel.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITS_Repository.h"
#import "ITS_ServiceUtils.h"
#import "Book+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface ITS_BookSearchViewModel : NSObject

@property (nonatomic) NSMutableArray *bookArray;
@property (nonatomic) ITS_Repository *repository;
- (void)fetchBooksWithQuery:(NSString *)queryString WithPage:(int)page withPerPage:(int)perPageNumber completion:(void (^)(NSArray * _Nonnull, NSString * _Nonnull))completion;

- (void) saveFavoriteBook;
@end

NS_ASSUME_NONNULL_END
