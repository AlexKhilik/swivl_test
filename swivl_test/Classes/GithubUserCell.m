//
//  UserCell.m
//  swivl_test
//
//  Created by Alexander Khilik on 24/03/15.
//  Copyright (c) 2015 Alexander Khilik. All rights reserved.
//

#import "GithubUserCell.h"
#import <UIImageView+WebCache.h>

@interface GithubUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UIButton *htmlUrlBtn;

- (IBAction)htmlUrlBtnTap:(id)sender;
- (IBAction)avatarBtnTap:(id)sender;

@end

@implementation GithubUserCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGithubUser:(GithubUser *)githubUser{
    _githubUser = githubUser;
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:githubUser.avatarUrl]];
    self.loginLabel.text = githubUser.login;
    [self.htmlUrlBtn setTitle:githubUser.htmlUrl forState:UIControlStateNormal];
}

- (IBAction)htmlUrlBtnTap:(id)sender {
    if([self.delegate respondsToSelector:@selector(GithubUserCell:openHtmlUrlForUser:)]){
        [self.delegate GithubUserCell:self openHtmlUrlForUser:self.githubUser];
    }
}

- (IBAction)avatarBtnTap:(id)sender {
    if([self.delegate respondsToSelector:@selector(GithubUserCell:openBigPhotoForUser:)]){
        [self.delegate GithubUserCell:self openBigPhotoForUser:self.githubUser];
    }
}

@end
