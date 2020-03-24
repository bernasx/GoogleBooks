//
//  Book+CoreDataClass.m
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//
//

#import "Book+CoreDataClass.h"

@implementation Book

@synthesize volumeInfo;
@synthesize saleInfo;
@synthesize imageLinks;

- (void)insertDataWithDict: (NSDictionary *) dict{

    //dicts inside dicts
    [self setVolumeInfo:dict[@"volumeInfo"]];
    [self setTitle:self.volumeInfo[@"title"]];
    [self setSubtitle:self.volumeInfo[@"subtitle"]];
    [self setAuthors:self.volumeInfo[@"authors"]];
    [self setPublisher:self.volumeInfo[@"publisher"]];
    [self setBookDescription:self.volumeInfo[@"description"]];
    [self setCategories:self.volumeInfo[@"categories"]];
    
    int pageCount = [self.volumeInfo[@"pageCount"] intValue];
    [self setPageCount:pageCount];
    
    //images
    [self setImageLinks:self.volumeInfo[@"imageLinks"]];
    [self setSmallThumbnail:self.imageLinks[@"smallThumbnail"]];
    [self setThumbnail:self.imageLinks[@"thumbnail"]];
    
    //standalone (directly from outside volumeInfo)
    [self setBookId:dict[@"id"]];
    [self setSelfLink:dict[@"selfLink"]];
}
@end
