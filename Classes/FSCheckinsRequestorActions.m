//
//  FSCheckinsRequestorActions.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSCheckinsRequestorActions.h"


@implementation FSCheckinsRequestorActions

- (id)initFSRequestorActions
{
	return self;
}

#pragma mark -
#pragma mark Checkins Add Comment API Request
- (NSDictionary *)addcommentCheckinsAPIRequest:(NSDictionary *)queryData
{
	NSString *checkinID = [queryData objectForKey:@"checkinID"];
	NSString *query;
	
	if (![(NSString *)[queryData objectForKey:@"text"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"text=%@&", (NSString *)[queryData objectForKey:@"text"]]];
	}
	
	NSDictionary *checkinAddcommentDict = [FSURLRequest URLString:[NSString stringWithFormat:@"checkins/%@/addcomment?", checkinID] dictionaryKey:@"checkinAddcommentDict" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return checkinAddcommentDict;
}

#pragma mark -
#pragma mark Checkins Delete Comment API Request
- (NSDictionary *)deletecommentCheckinsAPIRequest:(NSDictionary *)queryData
{
	NSString *checkinID = [queryData objectForKey:@"checkinID"];
	NSString *query;
	
	if (![(NSString *)[queryData objectForKey:@"commentId"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"commentId=%@&", (NSString *)[queryData objectForKey:@"commentId"]]];
	}
	
	NSDictionary *checkinDeletecommentDict = [FSURLRequest URLString:[NSString stringWithFormat:@"checkins/%@/deletecomment?", checkinID] dictionaryKey:@"checkinDeletecommentDict" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return checkinDeletecommentDict;
}

@end