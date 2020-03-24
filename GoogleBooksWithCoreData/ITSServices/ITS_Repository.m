//
//  ITS_Repository.m
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_Repository.h"

@implementation ITS_Repository

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.serviceManager = [[ITS_ServiceManager alloc] init];
        self.coreDataManager = [[ITS_CoreDataManager alloc] init];
    }
    return self;
}

- (void)fetchBooksWithQuery:(NSString *)queryString WithPage:(int)page withPerPage:(int)perPageNumber completion:(void (^)(NSDictionary * _Nonnull, NSError * _Nonnull))completion{
       NSString *path = @"volumes/";
       NSString *method = @"GET";
       
       NSDictionary *parameters = @{@"q":[[NSString alloc] initWithFormat:@"%@",queryString],
                                    @"startIndex": [[NSString alloc] initWithFormat:@"%i",page],
                                    @"maxResults":[[NSString alloc] initWithFormat:@"%i",perPageNumber],
                                   };
       
       self.serviceManager.url = [NSURL URLWithString:path relativeToURL: self.serviceManager.url];
       [self.serviceManager setRequestWithParameters:parameters withMethod:method];
    
       self.serviceManager.manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
       
       [self.serviceManager fetchData:^(NSDictionary * _Nonnull responseObject, NSError * _Nonnull error) {
           completion(responseObject, error);
       }];
}

- (void)fetchBooksWithSelfLink:(NSString *)selfLink completion:(void (^)(NSDictionary * _Nonnull, NSError * _Nonnull))completion{
    NSString *method = @"GET";
    
    NSDictionary *parameters = nil;
    self.serviceManager.url = [NSURL URLWithString:selfLink];
    [self.serviceManager setRequestWithParameters:parameters withMethod:method];
    self.serviceManager.manager.responseSerializer = [AFJSONResponseSerializer serializer];
       [self.serviceManager fetchData:^(NSDictionary * _Nonnull responseObject, NSError * _Nonnull error) {
           completion(responseObject, error);
       }];
}

- (NSArray *)fetchFavoritesFromCoreData{
    return [self.coreDataManager fetchWithEntityName:@"Book"];
}
@end
