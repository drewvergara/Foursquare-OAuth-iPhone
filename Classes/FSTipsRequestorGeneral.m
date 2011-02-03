//
//  FSTipsRequestorGeneral.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSTipsRequestorGeneral.h"


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
	query = [query stringByAppendingString:[NSString stringWithFormat:@"text=%@&", text]]];
	
	if (![(NSString *)[queryData objectForKey:@"url"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"url=%@&", (NSString *)[queryData objectForKey:@"url"]]];
	}
	
	NSDictionary *tipsAddDict = [FSURLRequest URLString:@"tips/add?" dictionaryKey:@"tipsAddDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return tipsAddDict;
}

@end