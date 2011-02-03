//
//  FSCheckinsRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import "FSCheckinsRequestor.h"
#import "FSURLRequest.h"
#import "FSCheckinsRequestorGeneral.h"
#import "FSCheckinsRequestorActions.h"

@implementation FSCheckinsRequestor

#pragma mark -
#pragma mark Create instance of FSCheckinsRequestor
- (id)initFSCheckinsRequest
{
	if (self = [super init])
	{
		
	}
	
    return self;
}

#pragma mark -
#pragma mark Checkins Information
- (NSDictionary *)getCheckinsInfo:(NSString *)checkinID
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSDictionary *checkinsDict = [FSURLRequest URLString:[NSString stringWithFormat:@"checkins/%@?", checkinID] dictionaryKey:@"checkinDictionary" httpMethod:@"GET"];
	
	//[self disectVenueInfo:venueDict];	
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return checkinsDict;
}

#pragma mark -
#pragma mark Checkins General API Request
- (NSDictionary *)generalCheckinAPIRequest:(NSString *)type
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSCheckinsRequestorGeneral *generalRequestor = [[FSCheckinsRequestorGeneral alloc] initFSRequestorGeneral];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"recent"]) {
		requestDict = [generalRequestor recentCheckinAPIRequest:nil];
	}else {
		requestDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Bad Request", @"error", nil];
	}
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}

- (NSDictionary *)generalCheckinAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSCheckinsRequestorGeneral *generalRequestor = [[FSCheckinsRequestorGeneral alloc] initFSRequestorGeneral];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"add"]) {		
		requestDict = [generalRequestor addCheckinAPIRequest:data];
	}
	
	if ([type isEqualToString:@"recent"]) {
		requestDict = [generalRequestor recentCheckinAPIRequest:data];
	}
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}

#pragma mark -
#pragma mark Checkins Actions API Request
- (NSDictionary *)actionsCheckinsAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSCheckinsRequestorActions *actionsRequestor = [[FSCheckinsRequestorActions alloc] initFSRequestorActions];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"addcomment"]) {
		requestDict = [actionsRequestor addcommentCheckinsAPIRequest:data];
	}
	
	if ([type isEqualToString:@"deletecomment"]) {
		requestDict = [actionsRequestor deletecommentCheckinsAPIRequest:data];
	}
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}
@end
