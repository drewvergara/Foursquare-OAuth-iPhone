//
//  FSUserRequestorGeneral.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/18/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSUserRequestorGeneral.h"
#import "FSURLRequest.h"


@implementation FSUserRequestorGeneral

- (id)initFSRequestorGeneral
{
    return self;
}

#pragma mark -
#pragma mark User Search API Request
- (NSDictionary *)searchUserAPIRequest:(NSDictionary *)queryData
{
	NSString *type = [queryData objectForKey:@"type"];
	NSString *query = [queryData objectForKey:@"query"];
	
	NSDictionary *userSearchDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/search?%@=%@&", type, query] dictionaryKey:@"userSearchDictionary" httpMethod:@"GET"];
	
	return userSearchDict;
}

#pragma mark -
#pragma mark User Requests API Request
- (NSDictionary *)requestsUserAPIRequest
{
	NSDictionary *userRequestsDict = [FSURLRequest URLString:@"users/requests?" dictionaryKey:@"userSearchDictionary" httpMethod:@"GET"];
	
	return userRequestsDict;
}

@end
