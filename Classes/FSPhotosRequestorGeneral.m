//
//  FSPhotosRequestorGeneral.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import "FSPhotosRequestorGeneral.h"
#import "FSURLRequest.h"

@implementation FSPhotosRequestorGeneral

- (id)initFSRequestorGeneral
{
	return self;
}

#pragma mark -
#pragma mark Photo Add API Request
- (NSDictionary *)addPhotoAPIRequest:(NSDictionary *)queryData
{
	NSString *query;
	
	if (![(NSString *)[queryData objectForKey:@"checkinId"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"checkinId=%@&", (NSString *)[queryData objectForKey:@"checkinId"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"tipId"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"tipId=%@&", (NSString *)[queryData objectForKey:@"tipId"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"venueId"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"venueId=%@&", (NSString *)[queryData objectForKey:@"venueId"]]];
	}
	
	if (![(NSString *)[queryData objectForKey:@"braodcast"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"braodcast=%@&", (NSString *)[queryData objectForKey:@"braodcast"]]];
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
	
	NSDictionary *photoAddDict = [FSURLRequest URLString:@"photos/add?" dictionaryKey:@"photoAddDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return photoAddDict;
}

@end
