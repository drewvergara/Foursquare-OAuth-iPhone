//
//  FSVenueRequestorActions.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSVenueRequestorActions.h"
#import "FSURLRequest.h"

@implementation FSVenueRequestorActions

- (id)initFSRequestorActions
{
	return self;
}
- (NSDictionary *)marktodoVenueAPIRequest:(NSDictionary *)queryData
{
	NSString *venueID = [queryData objectForKey:@"venueID"];
	NSString *query;
	
	if (![(NSString *)[queryData objectForKey:@"text"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"text=%@&", (NSString *)[queryData objectForKey:@"text"]]];
	}
	
	NSDictionary *venueMarktodoDict = [FSURLRequest URLString:[NSString stringWithFormat:@"venues/%@/marktodo?", venueID] dictionaryKey:@"venueMarktodoDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return venueMarktodoDict;
}

- (NSDictionary *)flagVenueAPIRequest:(NSDictionary *)queryData
{
	NSString *venueID = [queryData objectForKey:@"venueID"];
	NSString *query;
	
	if (![(NSString *)[queryData objectForKey:@"problem"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"problem=%@&", (NSString *)[queryData objectForKey:@"problem"]]];
	}
	
	NSDictionary *venueFlagDict = [FSURLRequest URLString:[NSString stringWithFormat:@"venues/%@/flag?", venueID] dictionaryKey:@"venueFlagDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return venueFlagDict;
}

- (NSDictionary *)proposeeditVenueAPIRequest:(NSDictionary *)queryData
{
	NSString *venueID = [queryData objectForKey:@"venueID"];
	NSString *query;

	if (![(NSString *)[queryData objectForKey:@"name"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"name=%@&", (NSString *)[queryData objectForKey:@"name"]]];
	}	
	
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
	
	NSDictionary *venueProposeeditDict = [FSURLRequest URLString:[NSString stringWithFormat:@"venues/%@/proposeedit?", venueID] dictionaryKey:@"venueProposeeditDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return venueProposeeditDict;
}
@end
