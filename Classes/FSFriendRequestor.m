//
//  FSFriendRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/29/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FSFriendRequestor.h"
#import "FSURLRequest.h"

@implementation FSFriendRequestor

@synthesize friendDictionary, friends,numberOfFriends;

- (id)initFSFriendRequestor:(NSString *)userToken
{
	if (self = [super init])
	{
		[self getFriendInfo:userToken];
	}
	
    return self;
}

- (void)getFriendInfo:(NSString *)token
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSDictionary *friendDict = [FSURLRequest URLString:[NSString stringWithFormat:@"https://api.foursquare.com/v2/users/self/friends?oauth_token=%@", token] dictionaryKey:@"friendDictionary" httpMethod:@"GET"];
		
	[self disectFriendInfo:friendDict];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)disectFriendInfo:(NSDictionary *)dict
{
	NSDictionary *info = [dict objectForKey:@"friendDictionary"];
	NSDictionary *response = [info objectForKey:@"response"];
	NSDictionary *friendsDict = [response objectForKey:@"friends"];
	
	self.friendDictionary = friendsDict;
	self.friends = [friendsDict objectForKey:@"items"];
	self.numberOfFriends = [friendsDict objectForKey:@"count"];
}

@end
