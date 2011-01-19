//
//  FSUserRequestorAspects.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/18/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSUserRequestorAspects.h"
#import "FSURLRequest.h"

@implementation FSUserRequestorAspects

- (id)initFSRequestorAspects
{
    return self;
}

- (NSDictionary *)badgesUserAPIRequest:(NSString *)userID
{
	NSDictionary *userBadgesDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/badges?", userID] dictionaryKey:@"userBadgesDictionary" httpMethod:@"GET"];
	
	return userBadgesDict;
}

- (NSDictionary *)checkinsUserAPIRequest:(NSDictionary *)queryData
{
	return nil;
}

- (NSDictionary *)friendsUserAPIRequest:(NSString *)userID
{
	NSDictionary *userFriendsDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/friends?", userID] dictionaryKey:@"userFriendsDictionary" httpMethod:@"GET"];
	
	return userFriendsDict;
}

- (NSDictionary *)tipsUserAPIRequest:(NSDictionary *)queryData
{
	return nil;
}

- (NSDictionary *)todosUserAPIRequest:(NSDictionary *)queryData
{
	return nil;
}

- (NSDictionary *)venuehistoryUserAPIRequest:(NSString *)userID
{
	NSDictionary *userVenuehistorysDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/venuehistory?", @"self"] dictionaryKey:@"userVenuehistoryDictionary" httpMethod:@"GET"];
	
	return userVenuehistorysDict;
}
@end
