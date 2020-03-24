//
//  Book+CoreDataProperties.m
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//
//

#import "Book+CoreDataProperties.h"

@implementation Book (CoreDataProperties)

+ (NSFetchRequest<Book *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Book"];
}

@dynamic authors;
@dynamic bookDescription;
@dynamic bookId;
@dynamic buyLink;
@dynamic categories;
@dynamic pageCount;
@dynamic previewLink;
@dynamic publisher;
@dynamic saleability;
@dynamic selfLink;
@dynamic smallThumbnail;
@dynamic subtitle;
@dynamic thumbnail;
@dynamic title;

@end
