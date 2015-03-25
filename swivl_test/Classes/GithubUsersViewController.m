//
//  UsersViewController.m
//  swivl_test
//
//  Created by Alexander Khilik on 24/03/15.
//  Copyright (c) 2015 Alexander Khilik. All rights reserved.
//

#import "GithubUsersViewController.h"
#import "GithubUser.h"
#import "GithubUserCell.h"
#import "WebAPI.h"

#define ROW_HEIGHT 100.0;

@interface GithubUsersViewController ()<GithubUserCellDelegate>{
    GithubUser *_selectedGithubUser;
    NSArray *_githubUsers;
    UIRefreshControl *_refreshControl;
}

@end

@implementation GithubUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = ROW_HEIGHT;
    
    //add pull to refresh
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl addTarget:self action:@selector(loadUsers) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_refreshControl];
    
    //remove separator at the end of the table
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    
    [self startInitialLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ROW_HEIGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _githubUsers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GithubUserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GithubUserCell"];
    cell.delegate = self;
    GithubUser *githubUser = [_githubUsers objectAtIndex:indexPath.row];
    cell.githubUser = githubUser;
    
    return cell;
}

#pragma mark - GithubUserCellDelegate -

- (void)GithubUserCell:(GithubUserCell *)cell openHtmlUrlForUser:(GithubUser *)githubUser{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:githubUser.htmlUrl]];
}

#pragma mark - Private -

- (void)startInitialLoad{
    [_refreshControl beginRefreshing];
    [self.tableView setContentOffset:CGPointMake(0, -_refreshControl.frame.size.height/2) animated:YES];
    [self loadUsers];
}

- (void)loadUsers{
    [WebAPI getGithubUsersWithSuccess:^(NSArray *users) {
        [_refreshControl endRefreshing];
        _githubUsers = users;
        [self.tableView reloadData];
    } andFailure:^(NSError *error) {
        [_refreshControl endRefreshing];
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"Error") message:error.localizedDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"Ok", @"Ok") otherButtonTitles:nil] show];
    }];
}

@end
