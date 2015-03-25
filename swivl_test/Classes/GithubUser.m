//
//  GithubUser.m
//
//  Created by Alexander Khilik on 24/03/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GithubUser.h"

NSString *const kGithubUserId = @"id";
NSString *const kGithubUserOrganizationsUrl = @"organizations_url";
NSString *const kGithubUserReceivedEventsUrl = @"received_events_url";
NSString *const kGithubUserFollowingUrl = @"following_url";
NSString *const kGithubUserLogin = @"login";
NSString *const kGithubUserSubscriptionsUrl = @"subscriptions_url";
NSString *const kGithubUserAvatarUrl = @"avatar_url";
NSString *const kGithubUserUrl = @"url";
NSString *const kGithubUserType = @"type";
NSString *const kGithubUserReposUrl = @"repos_url";
NSString *const kGithubUserHtmlUrl = @"html_url";
NSString *const kGithubUserEventsUrl = @"events_url";
NSString *const kGithubUserSiteAdmin = @"site_admin";
NSString *const kGithubUserStarredUrl = @"starred_url";
NSString *const kGithubUserGistsUrl = @"gists_url";
NSString *const kGithubUserGravatarId = @"gravatar_id";
NSString *const kGithubUserFollowersUrl = @"followers_url";

@interface GithubUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GithubUser

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.userId = [[self objectOrNilForKey:kGithubUserId fromDictionary:dict] doubleValue];
        self.organizationsUrl = [self objectOrNilForKey:kGithubUserOrganizationsUrl fromDictionary:dict];
        self.receivedEventsUrl = [self objectOrNilForKey:kGithubUserReceivedEventsUrl fromDictionary:dict];
        self.followingUrl = [self objectOrNilForKey:kGithubUserFollowingUrl fromDictionary:dict];
        self.login = [self objectOrNilForKey:kGithubUserLogin fromDictionary:dict];
        self.subscriptionsUrl = [self objectOrNilForKey:kGithubUserSubscriptionsUrl fromDictionary:dict];
        self.avatarUrl = [self objectOrNilForKey:kGithubUserAvatarUrl fromDictionary:dict];
        self.url = [self objectOrNilForKey:kGithubUserUrl fromDictionary:dict];
        self.type = [self objectOrNilForKey:kGithubUserType fromDictionary:dict];
        self.reposUrl = [self objectOrNilForKey:kGithubUserReposUrl fromDictionary:dict];
        self.htmlUrl = [self objectOrNilForKey:kGithubUserHtmlUrl fromDictionary:dict];
        self.eventsUrl = [self objectOrNilForKey:kGithubUserEventsUrl fromDictionary:dict];
        self.siteAdmin = [[self objectOrNilForKey:kGithubUserSiteAdmin fromDictionary:dict] boolValue];
        self.starredUrl = [self objectOrNilForKey:kGithubUserStarredUrl fromDictionary:dict];
        self.gistsUrl = [self objectOrNilForKey:kGithubUserGistsUrl fromDictionary:dict];
        self.gravatarId = [self objectOrNilForKey:kGithubUserGravatarId fromDictionary:dict];
        self.followersUrl = [self objectOrNilForKey:kGithubUserFollowersUrl fromDictionary:dict];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithInteger:self.userId] forKey:kGithubUserId];
    [mutableDict setValue:self.organizationsUrl forKey:kGithubUserOrganizationsUrl];
    [mutableDict setValue:self.receivedEventsUrl forKey:kGithubUserReceivedEventsUrl];
    [mutableDict setValue:self.followingUrl forKey:kGithubUserFollowingUrl];
    [mutableDict setValue:self.login forKey:kGithubUserLogin];
    [mutableDict setValue:self.subscriptionsUrl forKey:kGithubUserSubscriptionsUrl];
    [mutableDict setValue:self.avatarUrl forKey:kGithubUserAvatarUrl];
    [mutableDict setValue:self.url forKey:kGithubUserUrl];
    [mutableDict setValue:self.type forKey:kGithubUserType];
    [mutableDict setValue:self.reposUrl forKey:kGithubUserReposUrl];
    [mutableDict setValue:self.htmlUrl forKey:kGithubUserHtmlUrl];
    [mutableDict setValue:self.eventsUrl forKey:kGithubUserEventsUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.siteAdmin] forKey:kGithubUserSiteAdmin];
    [mutableDict setValue:self.starredUrl forKey:kGithubUserStarredUrl];
    [mutableDict setValue:self.gistsUrl forKey:kGithubUserGistsUrl];
    [mutableDict setValue:self.gravatarId forKey:kGithubUserGravatarId];
    [mutableDict setValue:self.followersUrl forKey:kGithubUserFollowersUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];

    self.userId = [aDecoder decodeIntegerForKey:kGithubUserId];
    self.organizationsUrl = [aDecoder decodeObjectForKey:kGithubUserOrganizationsUrl];
    self.receivedEventsUrl = [aDecoder decodeObjectForKey:kGithubUserReceivedEventsUrl];
    self.followingUrl = [aDecoder decodeObjectForKey:kGithubUserFollowingUrl];
    self.login = [aDecoder decodeObjectForKey:kGithubUserLogin];
    self.subscriptionsUrl = [aDecoder decodeObjectForKey:kGithubUserSubscriptionsUrl];
    self.avatarUrl = [aDecoder decodeObjectForKey:kGithubUserAvatarUrl];
    self.url = [aDecoder decodeObjectForKey:kGithubUserUrl];
    self.type = [aDecoder decodeObjectForKey:kGithubUserType];
    self.reposUrl = [aDecoder decodeObjectForKey:kGithubUserReposUrl];
    self.htmlUrl = [aDecoder decodeObjectForKey:kGithubUserHtmlUrl];
    self.eventsUrl = [aDecoder decodeObjectForKey:kGithubUserEventsUrl];
    self.siteAdmin = [aDecoder decodeBoolForKey:kGithubUserSiteAdmin];
    self.starredUrl = [aDecoder decodeObjectForKey:kGithubUserStarredUrl];
    self.gistsUrl = [aDecoder decodeObjectForKey:kGithubUserGistsUrl];
    self.gravatarId = [aDecoder decodeObjectForKey:kGithubUserGravatarId];
    self.followersUrl = [aDecoder decodeObjectForKey:kGithubUserFollowersUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:_userId forKey:kGithubUserId];
    [aCoder encodeObject:_organizationsUrl forKey:kGithubUserOrganizationsUrl];
    [aCoder encodeObject:_receivedEventsUrl forKey:kGithubUserReceivedEventsUrl];
    [aCoder encodeObject:_followingUrl forKey:kGithubUserFollowingUrl];
    [aCoder encodeObject:_login forKey:kGithubUserLogin];
    [aCoder encodeObject:_subscriptionsUrl forKey:kGithubUserSubscriptionsUrl];
    [aCoder encodeObject:_avatarUrl forKey:kGithubUserAvatarUrl];
    [aCoder encodeObject:_url forKey:kGithubUserUrl];
    [aCoder encodeObject:_type forKey:kGithubUserType];
    [aCoder encodeObject:_reposUrl forKey:kGithubUserReposUrl];
    [aCoder encodeObject:_htmlUrl forKey:kGithubUserHtmlUrl];
    [aCoder encodeObject:_eventsUrl forKey:kGithubUserEventsUrl];
    [aCoder encodeBool:_siteAdmin forKey:kGithubUserSiteAdmin];
    [aCoder encodeObject:_starredUrl forKey:kGithubUserStarredUrl];
    [aCoder encodeObject:_gistsUrl forKey:kGithubUserGistsUrl];
    [aCoder encodeObject:_gravatarId forKey:kGithubUserGravatarId];
    [aCoder encodeObject:_followersUrl forKey:kGithubUserFollowersUrl];
}

- (id)copyWithZone:(NSZone *)zone{
    GithubUser *copy = [[GithubUser alloc] init];
    
    if (copy) {
        copy.userId = self.userId;
        copy.organizationsUrl = [self.organizationsUrl copyWithZone:zone];
        copy.receivedEventsUrl = [self.receivedEventsUrl copyWithZone:zone];
        copy.followingUrl = [self.followingUrl copyWithZone:zone];
        copy.login = [self.login copyWithZone:zone];
        copy.subscriptionsUrl = [self.subscriptionsUrl copyWithZone:zone];
        copy.avatarUrl = [self.avatarUrl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.reposUrl = [self.reposUrl copyWithZone:zone];
        copy.htmlUrl = [self.htmlUrl copyWithZone:zone];
        copy.eventsUrl = [self.eventsUrl copyWithZone:zone];
        copy.siteAdmin = self.siteAdmin;
        copy.starredUrl = [self.starredUrl copyWithZone:zone];
        copy.gistsUrl = [self.gistsUrl copyWithZone:zone];
        copy.gravatarId = [self.gravatarId copyWithZone:zone];
        copy.followersUrl = [self.followersUrl copyWithZone:zone];
    }
    return copy;
}

@end
