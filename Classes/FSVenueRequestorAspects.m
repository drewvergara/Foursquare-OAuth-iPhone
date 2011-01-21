//
//  FSVenueRequestorAspects.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSVenueRequestorAspects.h"
#import "FSURLRequest.h"

@implementation FSVenueRequestorAspects

- (id)initFSRequestorAspects
{
	return self;
}

#pragma mark -
#pragma mark Venue Here Now API Request
- (NSDictionary *)herenowVenueAPIRequest:(NSDictionary *)queryData
{
	NSString *venueID = [queryData objectForKey:@"venueID"];
	NSString *query = @"?";
	
	if (![(NSString *)[queryData objectForKey:@"limit"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"limit=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"offset"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"offset=%@&", (NSString *)[queryData objectForKey:@"offset"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"afterTimestamp"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"afterTimestamp=%@&", (NSString *)[queryData objectForKey:@"afterTimestamp"]]];
	}
	
	NSDictionary *venueHerenowDict = [FSURLRequest URLString:[NSString stringWithFormat:@"venues/%@/herenow%@", venueID, query] dictionaryKey:@"venueHerenowDictionary" httpMethod:@"GET"];
	
	return venueHerenowDict;
}

#pragma mark -
#pragma mark Venue Tips API Request
- (NSDictionary *)tipsVenueAPIRequest:(NSDictionary *)queryData
{
	NSString *venueID = [queryData objectForKey:@"venueID"];
	NSString *query = @"?";
	
	if (![(NSString *)[queryData objectForKey:@"sort"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"sort=%@&", (NSString *)[queryData objectForKey:@"sort"]]];
	}	
	
	if (![(NSString *)[queryData objectForKey:@"limit"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"limit=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"offset"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"offset=%@&", (NSString *)[queryData objectForKey:@"offset"]]];
	}
	
	NSDictionary *venueTipsDict = [FSURLRequest URLString:[NSString stringWithFormat:@"venues/%@/tips%@", venueID, query] dictionaryKey:@"venueTipsDictionary" httpMethod:@"GET"];
	
	return venueTipsDict;
}

#pragma mark -
#pragma mark Venue Photos API Request
- (NSDictionary *)photosVenueAPIRequest:(NSDictionary *)queryData
{
	NSString *venueID = [queryData objectForKey:@"venueID"];
	NSString *query = @"?";
	
	if (![(NSString *)[queryData objectForKey:@"group"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"group=%@&", (NSString *)[queryData objectForKey:@"group"]]];
	}	
	
	if (![(NSString *)[queryData objectForKey:@"limit"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"limit=%@&", (NSString *)[queryData objectForKey:@"limit"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"offset"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"offset=%@&", (NSString *)[queryData objectForKey:@"offset"]]];
	}
	
	NSDictionary *venuePhotosDict = [FSURLRequest URLString:[NSString stringWithFormat:@"venues/%@/photos%@", venueID, query] dictionaryKey:@"venuePhotosDictionary" httpMethod:@"GET"];
	
	return venuePhotosDict;	
}
@end
