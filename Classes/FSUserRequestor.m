//
//  FSUserRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/22/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FSUserRequestor.h"
#import "FSURLRequest.h"

@implementation FSUserRequestor

@synthesize securityToken;
@synthesize responseData, userDictionary, checkins, contact, friends, mayorships, userID, userPhotoURL;
@synthesize fullName, firstName, lastName, userGender, userHomeCity;


#pragma mark -
#pragma mark Create instance of FSUserRequestor
- (id)initFSUser
{
	if (self = [super init])
	{
		//self.securityToken = userToken;
		//[self getUserInfo:user securityToken:userToken];
	}
	
    return self;
}

#pragma mark -
#pragma mark User Information
//Retrieve a user's information
- (NSDictionary *)getUserInfo:(NSString *)user
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSDictionary *userDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/%@?", user] dictionaryKey:@"userDictionary" httpMethod:@"GET"];
	
	if ([user isEqualToString:@"self"]) {
		[self disectUserInfo:userDict];	
	}

	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return userDict;
}

#pragma mark -
#pragma mark User API Request
- (NSDictionary *)generalUserAPIRequest:(NSString *)type requestData:(NSDictionary *)data
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	if ([type isEqualToString:@"search"]) {
		NSLog(@"user search");
		
		NSDictionary *userSearchDict = [FSURLRequest URLString:[NSString stringWithFormat:@"users/search?%@=%@&", type, search] dictionaryKey:@"userSearchDictionary" httpMethod:@"GET"];
	}

	if ([type isEqualToString:@"requests"]) {
		NSLog(@"user requests");
	}
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return nil;
}

#pragma mark -
#pragma mark User Info Disection
//Disection of userDictionary.  Only if the user is self.
- (void)disectUserInfo:(NSDictionary *)dict
{
	NSDictionary *info = [dict objectForKey:@"userDictionary"];
	NSDictionary *response = [info objectForKey:@"response"];
	NSDictionary *user = [response objectForKey:@"user"];
	self.userDictionary = user;
	self.userID = [user objectForKey:@"id"];
	self.userPhotoURL = [user objectForKey:@"photo"];
	
	self.firstName = [user objectForKey:@"firstName"];
	self.lastName = [user objectForKey:@"lastName"];
	self.fullName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
	self.userGender = [user objectForKey:@"gender"];
	self.userHomeCity = [user objectForKey:@"homeCity"];
	
	self.checkins = [user objectForKey:@"checkins"];
	self.contact = [user objectForKey:@"contact"];
	self.friends = [user objectForKey:@"friends"];
	self.mayorships = [user objectForKey:@"mayorships"];	
}

@end
