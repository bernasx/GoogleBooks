//
//  ITS_BookSearchViewModel.m
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_BookSearchViewModel.h"

@implementation ITS_BookSearchViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bookArray = [[NSMutableArray alloc] init];
        self.repository = [[ITS_Repository alloc] init];
    }
    return self;
}

- (void)fetchBooksWithQuery:(NSString *)queryString WithPage:(int)page withPerPage:(int)perPageNumber completion:(void (^)(NSArray * _Nullable, NSString * _Nullable))completion{
    [self.repository fetchBooksWithQuery:queryString WithPage:page withPerPage:perPageNumber completion:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if(error){
            completion(nil,[ITS_ServiceUtils checkStatusCode:error]);
        }else{
            NSMutableArray *bookArray = [NSMutableArray arrayWithArray:responseObject[@"items"]];
            for(NSDictionary *dict in bookArray){
                Book *book = [[Book alloc] initWithContext:self.repository.coreDataManager.tempContext];
                [book insertDataWithDict:dict];
                [self.bookArray addObject:book];
            }
            completion(self.bookArray,nil);
        }
        
    }];
}

- (void) saveFavoriteBook{
    [self.repository.coreDataManager saveContext];
}
@end
