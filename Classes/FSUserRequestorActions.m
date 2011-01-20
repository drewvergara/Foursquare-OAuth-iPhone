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

- (NSDictionary *)requestUserAPIRequest:(NSDictionary *)queryData
{
	NSString *userID = [queryData objectForKey:@"userID"];
	NSDictionary *userRequestDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@/request?", userID] dictionaryKey:@"userRequestDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"USER_ID=%@", userID]];
	
	return userRequestDict;
}

- (NSDictionary *)unfriendUserAPIRequest:(NSDictionary *)queryData
{
	return nil;
}

- (NSDictionary *)approveUserAPIRequest:(NSDictionary *)queryData
{
	return nil;
}

- (NSDictionary *)denyUserAPIRequest:(NSDictionary *)queryData
{
	return nil;
}

- (NSDictionary *)setpingsUserAPIRequest:(NSDictionary *)queryData
{
	return nil;
}

@end
