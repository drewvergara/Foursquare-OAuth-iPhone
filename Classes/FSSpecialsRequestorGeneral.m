//
//  FSSpecialsRequestorGeneral.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import "FSSpecialsRequestorGeneral.h"
#import "FSURLRequest.h"

@implementation FSSpecialsRequestorGeneral

- (id)initFSRequestorGeneral
{
	return self;
}

#pragma mark -
#pragma mark Specials Search API Request
- (NSDictionary *)searchSpecialsAPIRequest:(NSDictionary *)queryData
{
	NSString *query = @"?";
	
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
	
	if (![(NSString *)[queryData objectForKey:@"limit"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"limit=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	NSDictionary *specialsSearchDict = [FSURLRequest URLString:[NSString stringWithFormat:@"specials/search%@", query] dictionaryKey:@"specialsSearchDictionary" httpMethod:@"GET"];
	
	return specialsSearchDict;
}

@end