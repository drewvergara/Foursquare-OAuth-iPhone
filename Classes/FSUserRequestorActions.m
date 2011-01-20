//
//  FSUserRequestorActions.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/18/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSUserRequestorActions.h"
#import "FSURLRequest.h"

@implementation FSUserRequestorActions

- (id)initFSRequestorActions
{
    return self;
}

#pragma mark -
#pragma mark User Request API Request
- (NSDictionary *)requestUserAPIRequest:(NSString *)userID
{
	//Foursquare API is unclear which userID should be in the URL
	NSString *user = @"self";
	
	NSDictionary *userRequestDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/request?", user] dictionaryKey:@"userRequestDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"USER_ID=%@", userID]];

	return userRequestDict;
}

#pragma mark -
#pragma mark User Unfriend API Request
- (NSDictionary *)unfriendUserAPIRequest:(NSString *)userID
{
	//Foursquare API is unclear which userID should be in the URL
	NSString *user = @"self";
	
	NSDictionary *userUnfriendDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/unfriend?", user] dictionaryKey:@"userUnfriendDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"USER_ID=%@", userID]];
	
	return userUnfriendDict;
}

#pragma mark -
#pragma mark User Approve API Request
- (NSDictionary *)approveUserAPIRequest:(NSString *)userID
{
	//Foursquare API is unclear which userID should be in the URL
	NSString *user = @"self";
	
	NSDictionary *userApproveDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/approve?", user] dictionaryKey:@"userApproveDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"USER_ID=%@", userID]];
	
	return userApproveDict;
}

#pragma mark -
#pragma mark User Deny API Request
- (NSDictionary *)denyUserAPIRequest:(NSString *)userID
{
	//Foursquare API is unclear which userID should be in the URL
	NSString *user = @"self";
	
	NSDictionary *userDenyDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/deny?", user] dictionaryKey:@"userDenyDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"USER_ID=%@", userID]];
	
	return userDenyDict;
}

#pragma mark -
#pragma mark User SetPings API Request
- (NSDictionary *)setpingsUserAPIRequest:(NSDictionary *)queryData
{
	//Foursquare API is unclear which userID should be in the URL
	NSString *user = @"self";
	NSString *userID = [queryData objectForKey:@"userID"];
	NSString *value = [queryData objectForKey:@"value"];
	
	NSDictionary *userSetpingsDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/setpings?", user] dictionaryKey:@"userSetpingsDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"USER_ID=%@&value=%@", userID, value]];
	
	return userSetpingsDict;
}

@end
