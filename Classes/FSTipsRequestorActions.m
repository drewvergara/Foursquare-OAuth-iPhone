//
//  FSTipsRequestorActions.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSTipsRequestorActions.h"
#import "FSURLRequest.h"

@implementation FSTipsRequestorActions

- (id)initFSTipsRequestorActions
{
	return self;
}

#pragma mark -
#pragma mark Tips Mark Todo API Request
- (NSDictionary *)marktodoTipsAPIRequest:(NSDictionary *)queryData
{
	NSString *tipID = [queryData objectForKey:@"tipID"];
	NSString *query;
	
	if (![(NSString *)[queryData objectForKey:@"TIP_ID"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"TIP_ID=%@&", tipID]];
	}
	
	NSDictionary *tipsMarktodoDict = [FSURLRequest URLString:[NSString stringWithFormat:@"tips/%@/marktodo?", tipID] dictionaryKey:@"tipsMarktodoDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return tipsMarktodoDict;
}

#pragma mark -
#pragma mark Tips Mark Done API Request
- (NSDictionary *)markdoneTipsAPIRequest:(NSDictionary *)queryData
{
	NSString *tipID = [queryData objectForKey:@"tipID"];
	NSString *query;
	
	if (![(NSString *)[queryData objectForKey:@"TIP_ID"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"TIP_ID=%@&", tipID]];
	}
	
	NSDictionary *tipsMarkdoneDict = [FSURLRequest URLString:[NSString stringWithFormat:@"tips/%@/markdone?", tipID] dictionaryKey:@"tipsMarkdoneDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return tipsMarkdoneDict;
}

#pragma mark -
#pragma mark Tips Unmark API Request
- (NSDictionary *)unmarkTipsAPIRequest:(NSDictionary *)queryData
{
	NSString *tipID = [queryData objectForKey:@"tipID"];
	NSString *query;
	
	if (![(NSString *)[queryData objectForKey:@"TIP_ID"] isEqualToString:@""]) {
		query = [query stringByAppendingString:[NSString stringWithFormat:@"TIP_ID=%@&", tipID]];
	}
	
	NSDictionary *tipsUnmarkDict = [FSURLRequest URLString:[NSString stringWithFormat:@"tips/%@/unmark?", tipID] dictionaryKey:@"tipsUnmarkDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return tipsUnmarkDict;
}

@end