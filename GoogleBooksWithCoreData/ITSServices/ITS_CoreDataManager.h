//
//  ITS_CoreDataManager.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITS_CoreDataManager : NSObject
@property (nonatomic) NSManagedObjectContext *parentContext;
@property (nonatomic) NSManagedObjectContext *tempContext;
- (void)saveContext;
- (NSArray *)fetchWithEntityName: (NSString *) entityName;
@end

NS_ASSUME_NONNULL_END
