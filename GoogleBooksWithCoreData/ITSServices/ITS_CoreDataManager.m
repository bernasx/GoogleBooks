//
//  ITS_CoreDataManager.m
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import "ITS_CoreDataManager.h"

@implementation ITS_CoreDataManager
- (instancetype)init
{
    self = [super init];
    if (self) {
         self.parentContext = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
        self.tempContext.parentContext = self.parentContext;
    }
    return self;
}

- (void)saveContext {
    NSError *error = nil;
    if ([self.parentContext hasChanges] && ![self.parentContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

//grabs evverything from the entity table
- (NSArray *)fetchWithEntityName: (NSString *) entityName{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    NSArray *array = [self.parentContext executeFetchRequest:request error:nil];
    return array;
}
@end
