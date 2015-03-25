//
//  UserCell.h
//  swivl_test
//
//  Created by Alexander Khilik on 24/03/15.
//  Copyright (c) 2015 Alexander Khilik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GithubUser.h"

@class GithubUserCell;

@protocol GithubUserCellDelegate <NSObject>

- (void)GithubUserCell:(GithubUserCell *)cell openHtmlUrlForUser:(GithubUser *)githubUser;
- (void)GithubUserCell:(GithubUserCell *)cell openBigPhotoForUser:(GithubUser *)githubUser;

@end

@interface GithubUserCell : UITableViewCell

@property (weak, nonatomic) id<GithubUserCellDelegate> delegate;

@property (strong, nonatomic) GithubUser *githubUser;

@end
