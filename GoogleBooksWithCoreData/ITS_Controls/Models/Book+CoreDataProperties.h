//
//  Book+CoreDataProperties.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//
//

#import "Book+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

+ (NSFetchRequest<Book *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSObject *authors;
@property (nullable, nonatomic, copy) NSString *bookDescription;
@property (nullable, nonatomic, copy) NSString *bookId;
@property (nullable, nonatomic, copy) NSString *buyLink;
@property (nullable, nonatomic, retain) NSObject *categories;
@property (nonatomic) int16_t pageCount;
@property (nullable, nonatomic, copy) NSString *previewLink;
@property (nullable, nonatomic, copy) NSString *publisher;
@property (nullable, nonatomic, copy) NSString *saleability;
@property (nullable, nonatomic, copy) NSString *selfLink;
@property (nullable, nonatomic, copy) NSString *smallThumbnail;
@property (nullable, nonatomic, copy) NSString *subtitle;
@property (nullable, nonatomic, copy) NSString *thumbnail;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
