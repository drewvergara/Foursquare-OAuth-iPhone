//
//  FSUserRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/22/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FSUserRequestor.h"
#import "FSURLRequest.h"
#import "FSUserRequestorGeneral.h"
#import "FSUserRequestorAspects.h"
#import "FSUserRequestorActions.h"

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
#pragma mark User General API Request
- (NSDictionary *)generalUserAPIRequest:(NSString *)type
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSUserRequestorGeneral *generalRequestor = [[FSUserRequestorGeneral alloc] initFSRequestorGeneral];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"requests"]) {
		requestDict = [generalRequestor requestsUserAPIRequest];
	}else {
		requestDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Bad Request", @"error", nil];
	}

	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}

- (NSDictionary *)generalUserAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSUserRequestorGeneral *generalRequestor = [[FSUserRequestorGeneral alloc] initFSRequestorGeneral];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"search"]) {		
		requestDict = [generalRequestor searchUserAPIRequest:data];
	}

	if ([type isEqualToString:@"requests"]) {
		requestDict = [generalRequestor requestsUserAPIRequest];
	}
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}

#pragma mark -
#pragma mark User Aspects API Request
- (NSDictionary *)aspectsUserAPIRequest:(NSString *)type withUserID:(NSString *)usersID
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSUserRequestorAspects *aspectsRequestor = [[FSUserRequestorAspects alloc] initFSRequestorAspects];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"badges"]) {		
		requestDict = [aspectsRequestor badgesUserAPIRequest:usersID];
	}
	
	if ([type isEqualToString:@"friends"]) {
		requestDict = [aspectsRequestor friendsUserAPIRequest:usersID];
	}
		
	if ([type isEqualToString:@"venuehistory"]) {
		requestDict = [aspectsRequestor venuehistoryUserAPIRequest:usersID];
	}
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}

- (NSDictionary *)aspectsUserAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSUserRequestorAspects *aspectsRequestor = [[FSUserRequestorAspects alloc] initFSRequestorAspects];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"checkins"]) {
		requestDict = [aspectsRequestor checkinsUserAPIRequest:data];
	}

	if ([type isEqualToString:@"tips"]) {
		requestDict = [aspectsRequestor tipsUserAPIRequest:data];
	}

	if ([type isEqualToString:@"todos"]) {
		requestDict = [aspectsRequestor todosUserAPIRequest:data];
	}
		
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}


#pragma mark -
#pragma mark User Acations API Request
- (NSDictionary *)actionsUserAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSUserRequestorActions *actionsRequestor = [[FSUserRequestorActions alloc] initFSRequestorActions];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"setpings"]) {
		requestDict = [actionsRequestor setpingsUserAPIRequest:data];
	}else {
		requestDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Bad Request", @"error", nil];
	}
	
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}

- (NSDictionary *)actionsUserAPIRequest:(NSString *)type withUserID:(NSString *)usersID
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSUserRequestorActions *actionsRequestor = [[FSUserRequestorActions alloc] initFSRequestorActions];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"request"]) {
		requestDict = [actionsRequestor requestUserAPIRequest:usersID];
	}
	
	if ([type isEqualToString:@"unfriend"]) {
		requestDict = [actionsRequestor unfriendUserAPIRequest:usersID];
	}
	
	if ([type isEqualToString:@"approve"]) {
		requestDict = [actionsRequestor approveUserAPIRequest:usersID];
	}
	
	if ([type isEqualToString:@"deny"]) {
		requestDict = [actionsRequestor denyUserAPIRequest:usersID];
	}
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
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
