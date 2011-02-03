//
//  FSTipsRequestorGeneral.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import "FSTipsRequestorGeneral.h"
#import "FSURLRequest.h"

@implementation FSTipsRequestorGeneral

- (id)initFSRequestorGeneral
{
	return self;
}

#pragma mark -
#pragma mark Tips Add API Request
- (NSDictionary *)addTipsAPIRequest:(NSDictionary *)queryData
{
	NSString *venueID = [queryData objectForKey:@"venueID"];
	NSString *text = [queryData objectForKey:@"text"];
	NSString *query;
	
	query = [query stringByAppendingString:[NSString stringWithFormat:@"venueID=%@&", venueID]];
	query = [query stringByAppendingString:[NSString stringWithFormat:@"text=%@&", text]];
	
	if (![(NSString *)[queryData objectForKey:@"url"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"url=%@&", (NSString *)[queryData objectForKey:@"url"]]];
	}
	
	NSDictionary *tipsAddDict = [FSURLRequest URLString:@"tips/add?" dictionaryKey:@"tipsAddDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return tipsAddDict;
}

#pragma mark -
#pragma mark Tips Search API Request
- (NSDictionary *)searchTipsAPIRequest:(NSDictionary *)queryData
{
	NSString *query = @"?";
	
	if (![(NSString *)[queryData objectForKey:@"ll"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"ll=%@&", (NSString *)[queryData objectForKey:@"ll"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"limit"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"limit=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"offset"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"offset=%@&", (NSString *)[queryData objectForKey:@"offset"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"filter"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"filter=%@&", (NSString *)[queryData objectForKey:@"filter"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"query"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"query=%@&", (NSString *)[queryData objectForKey:@"query"]]];
	}
		
	NSDictionary *tipsSearchDict = [FSURLRequest URLString:[NSString stringWithFormat:@"tip/search%@", query] dictionaryKey:@"tipsSearchDictionary" httpMethod:@"GET"];
	
	return tipsSearchDict;
}

@end