//
//  FSSettingsRequestorActions.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import "FSSettingsRequestorActions.h"
#import "FSURLRequest.h"

@implementation FSSettingsRequestorActions

- (id)initFSSettingsRequestorActions
{
	return self;
}

#pragma mark -
#pragma mark Settings Set API Request
- (NSDictionary *)setSettingsAPIRequest:(NSDictionary *)queryData
{
	NSString *settingID = [queryData objectForKey:@"settingID"];
	NSString *value = [queryData objectForKey:@"value"];
	NSString *query;
	
	query = [query stringByAppendingString:[NSString stringWithFormat:@"SETTING_ID=%@&", settingID]];
	query = [query stringByAppendingString:[NSString stringWithFormat:@"value=%@&", value]];
	
	NSDictionary *settingsSetDict = [FSURLRequest URLString:[NSString stringWithFormat:@"settings/%@/set?", settingID] dictionaryKey:@"settingsSetDictionary" httpMethod:@"POST" withPOSTData:[NSString stringWithFormat:@"%@", query]];
	
	return settingsSetDict;
}

@end