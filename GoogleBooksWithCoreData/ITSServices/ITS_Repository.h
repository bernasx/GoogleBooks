//
//  ITS_Repository.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITS_ServiceManager.h"
#import "ITS_CoreDataManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITS_Repository : NSObject
@property (nonatomic) ITS_ServiceManager *serviceManager;
@property (nonatomic) ITS_CoreDataManager *coreDataManager;
- (void) fetchBooksWithQuery: (NSString*)queryString  WithPage: (int) page withPerPage: (int) perPageNumber completion:(void(^)(NSDictionary *responseObject, NSError *error)) completion; //fetch books with given query

- (void) fetchBooksWithSelfLink: (NSString*)selfLink  completion:(void(^)(NSDictionary *responseObject, NSError *error)) completion; //fetch books with selfLink

- (NSArray *) fetchFavoritesFromCoreData;
@end

NS_ASSUME_NONNULL_END
