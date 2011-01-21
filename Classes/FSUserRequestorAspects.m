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

#pragma mark -
#pragma mark User Badges API Request
- (NSDictionary *)badgesUserAPIRequest:(NSString *)userID
{
	NSDictionary *userBadgesDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/badges?", userID] dictionaryKey:@"userBadgesDictionary" httpMethod:@"GET"];
	
	return userBadgesDict;
}

#pragma mark -
#pragma mark User Checkins API Request
- (NSDictionary *)checkinsUserAPIRequest:(NSDictionary *)queryData
{
	NSString *userID = [queryData objectForKey:@"userID"];
	NSString *query = @"?";

	if (![(NSString *)[queryData objectForKey:@"limit"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"limit=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}

	if (![(NSString *)[queryData objectForKey:@"offset"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"offset=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}

	if (![(NSString *)[queryData objectForKey:@"afterTimestamp"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"afterTimestamp=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}

	if (![(NSString *)[queryData objectForKey:@"beforeTimestamp"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"beforeTimestamp=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}

	NSDictionary *userCheckinsDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/checkins%@", userID, query] dictionaryKey:@"userCheckinsDictionary" httpMethod:@"GET"];
	
	return userCheckinsDict;
}

#pragma mark -
#pragma mark User Friends API Request
- (NSDictionary *)friendsUserAPIRequest:(NSString *)userID
{
	NSDictionary *userFriendsDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/friends?", userID] dictionaryKey:@"userFriendsDictionary" httpMethod:@"GET"];
	
	return userFriendsDict;
}

#pragma mark -
#pragma mark User Tips API Request
- (NSDictionary *)tipsUserAPIRequest:(NSDictionary *)queryData
{
	NSString *userID = [queryData objectForKey:@"userID"];
	NSString *query = @"?";

	if (![(NSString *)[queryData objectForKey:@"sort"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"sort=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"ll"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"ll=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	NSDictionary *userTipsDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/tips%@", userID, query] dictionaryKey:@"userTipsDictionary" httpMethod:@"GET"];
	
	return userTipsDict;
}

#pragma mark -
#pragma mark User Todos API Request
- (NSDictionary *)todosUserAPIRequest:(NSDictionary *)queryData
{
	NSString *userID = [queryData objectForKey:@"userID"];
	NSString *query = @"?";
	
	if (![(NSString *)[queryData objectForKey:@"sort"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"sort=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"ll"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"ll=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}	
	
	NSDictionary *userTodosDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/todos%@", userID, query] dictionaryKey:@"userTodosDictionary" httpMethod:@"GET"];
	
	return userTodosDict;
}

#pragma mark -
#pragma mark User VenueHistory API Request
- (NSDictionary *)venuehistoryUserAPIRequest:(NSString *)userID
{
	NSDictionary *userVenuehistorysDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/venuehistory?", @"self"] dictionaryKey:@"userVenuehistoryDictionary" httpMethod:@"GET"];
	
	return userVenuehistorysDict;
}
@end
