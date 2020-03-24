//
//  ITS_ServiceUtils.h
//  GoogleBooksWithCoreData
//
//  Created by Bernardo Ribeiro on 24/03/2020.
//  Copyright © 2020 Bernardo Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITS_ServiceUtils : NSObject

+ (void)connectedCompletionBlock:(void(^)(BOOL connected))block;
+ (NSString *)checkStatusCode:(NSError *) error;

@end

NS_ASSUME_NONNULL_END
