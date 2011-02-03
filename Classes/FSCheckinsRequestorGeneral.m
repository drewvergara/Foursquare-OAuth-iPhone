//
//  FSCheckinsRequestorGeneral.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSCheckinsRequestorGeneral.h"
#import "FSURLRequest.h"

@implementation FSCheckinsRequestorGeneral

- (id)initFSRequestorGeneral
{
	return self;
}

#pragma mark -
#pragma mark Checkins Add API Request
- (NSDictionary *)addCheckinAPIRequest:(NSDictionary *)queryData
{
	NSString *query;
	
	if (![(NSString *)[queryData objectForKey:@"venueId"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"venueId=%@&", (NSString *)[queryData objectForKey:@"venueId"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"venue"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"venue=%@&", (NSString *)[queryData objectForKey:@"venue"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"shout"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"shout=%@&", (NSString *)[queryData objectForKey:@"shout"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"broadcast"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"broadcast=%@&", (NSString *)[queryData objectForKey:@"braodcast"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"ll"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"ll=%@&", (NSString *)[queryData objectForKey:@"ll"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"llAcc"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"llAcc=%@&", (NSString *)[queryData objectForKey:@"llAcc"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"alt"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"alt=%@&", (NSString *)[queryData objectForKey:@"alt"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"altAcc"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"altAcc=%@&", (NSString *)[queryData objectForKey:@"altAcc"]]];
	}	
	
	NSDictionary *checkinAddDict = [FSURLRequest URLString:@"checkins/add?" dictionaryKey:@"checkinAddDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return checkinAddDict;
}


#pragma mark -
#pragma mark Checkins Recent API Request
- (NSDictionary *)recentCheckinAPIRequest:(NSDictionary *)queryData
{
	NSDictionary *checkinRecentDict;
	NSString *query = @"?";
	
	if (queryData = nil) {
		checkinRecentDict = [FSURLRequest URLString:@"checkins/recent?" dictionaryKey:@"checkinRecentDictionary" httpMethod:@"GET"];
	}
	
	if (![(NSString *)[queryData objectForKey:@"ll"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"ll=%@&", (NSString *)[queryData objectForKey:@"ll"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"limit"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"limit=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"afterTimestamp"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"afterTimestamp=%@&", (NSString *)[queryData objectForKey:@"afterTimestamp"]]];
	}	
		
	return checkinRecentDict;
}

@end