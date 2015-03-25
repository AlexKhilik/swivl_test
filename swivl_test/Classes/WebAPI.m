//
//  WebAPI.m
//  swivl_test
//
//  Created by Alexander Khilik on 24/03/15.
//  Copyright (c) 2015 Alexander Khilik. All rights reserved.
//

#import "WebAPI.h"
#import "GithubUser.h"
#import <AFNetworking/AFNetworking.h>

#define GET_USERS_URL @"https://api.github.com/users"

@implementation WebAPI

+ (void)getGithubUsersWithSuccess:(GetUsersSuccessBlock)success andFailure:(FailureBlock)failure{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:GET_USERS_URL]];
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    requestOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *githubUsers = [[NSMutableArray alloc] initWithCapacity:[responseObject count]];
        for(NSDictionary *userDict in responseObject){
            GithubUser *githubUser = [[GithubUser alloc] initWithDictionary:userDict];
            [githubUsers addObject:githubUser];
        }
        
        if(success){
            success(githubUsers);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {        
        if(failure){
            failure(error);
        }
    }];
    
    [requestOperation start];
}

@end
