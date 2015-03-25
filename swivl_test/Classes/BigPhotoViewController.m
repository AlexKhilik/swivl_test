//
//  BigPhotoViewController.m
//  swivl_test
//
//  Created by Alexander Khilik on 24/03/15.
//  Copyright (c) 2015 Alexander Khilik. All rights reserved.
//

#import "BigPhotoViewController.h"
#import "GithubUser.h"
#import <UIImageView+WebCache.h>

@interface BigPhotoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation BigPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.githubUser.avatarUrl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapBehind:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
