//
//  WebAPI.h
//  swivl_test
//
//  Created by Alexander Khilik on 24/03/15.
//  Copyright (c) 2015 Alexander Khilik. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GetUsersSuccessBlock)(NSArray *users);
typedef void(^FailureBlock)(NSError *error);

@interface WebAPI : NSObject

+ (void)getGithubUsersWithSuccess:(GetUsersSuccessBlock)success andFailure:(FailureBlock)failure;

@end
