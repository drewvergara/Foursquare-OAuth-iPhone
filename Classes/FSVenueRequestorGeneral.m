//
//  FSVenueRequestorGeneral.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import "FSVenueRequestorGeneral.h"
#import "FSURLRequest.h"

@implementation FSVenueRequestorGeneral

- (id)initFSRequestorGeneral
{
	return self;
}

#pragma mark -
#pragma mark Venue Add API Request
- (NSDictionary *)addVenueAPIRequest:(NSDictionary *)queryData
{
	NSString *venueName = [queryData objectForKey:@"name"];
	NSString *query;
	
	query = [query stringByAppendingString:[NSString stringWithFormat:@"name=%@&", venueName]];
	
	if (![(NSString *)[queryData objectForKey:@"address"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"address=%@&", (NSString *)[queryData objectForKey:@"address"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"crossStreet"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"crossStreet=%@&", (NSString *)[queryData objectForKey:@"crossStreet"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"city"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"city=%@&", (NSString *)[queryData objectForKey:@"city"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"state"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"state=%@&", (NSString *)[queryData objectForKey:@"state"]]];
	}

	if (![(NSString *)[queryData objectForKey:@"zip"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"zip=%@&", (NSString *)[queryData objectForKey:@"zip"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"phone"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"phone=%@&", (NSString *)[queryData objectForKey:@"phone"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"ll"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"ll=%@&", (NSString *)[queryData objectForKey:@"ll"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"primaryCategoryId"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"primaryCategoryId=%@&", (NSString *)[queryData objectForKey:@"primaryCategoryId"]]];
	}	
	
	NSDictionary *venueAddDict = [FSURLRequest URLString:@"venues/add?" dictionaryKey:@"venueAddDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return venueAddDict;
}

#pragma mark -
#pragma mark Venue Search API Request
- (NSDictionary *)searchVenueAPIRequest:(NSDictionary *)queryData
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
	
	if (![(NSString *)[queryData objectForKey:@"query"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"query=%@&", (NSString *)[queryData objectForKey:@"query"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"limit"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"limit=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"intent"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"intent=%@&", (NSString *)[queryData objectForKey:@"intent"]]];
	}
	
	NSDictionary *venueSearchDict = [FSURLRequest URLString:[NSString stringWithFormat:@"venues/search%@", query] dictionaryKey:@"venueSearchDictionary" httpMethod:@"GET"];
		
	return venueSearchDict;
}

#pragma mark -
#pragma mark Venue Categories API Request
- (NSDictionary *)categoriesVenueAPIRequest
{
	NSDictionary *venueCategoriesDict = [FSURLRequest URLString:@"venues/categories?" dictionaryKey:@"venueCategoriesDictionary" httpMethod:@"GET"];
	
	return venueCategoriesDict;
}
@end
