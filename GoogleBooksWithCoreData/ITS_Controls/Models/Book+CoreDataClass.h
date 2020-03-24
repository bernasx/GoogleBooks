//
//  Book+CoreDataClass.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSObject;

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSManagedObject


@property (nonatomic) NSDictionary *saleInfo;
@property (nonatomic) NSDictionary *volumeInfo;
@property (nonatomic) NSDictionary *imageLinks;
- (void)insertDataWithDict: (NSDictionary *) dict;
@end

NS_ASSUME_NONNULL_END

#import "Book+CoreDataProperties.h"
