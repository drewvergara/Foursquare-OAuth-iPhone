//
//  FSSettingsRequestorGeneral.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import "FSSettingsRequestorGeneral.h"
#import "FSURLRequest.h"

@implementation FSSettingsRequestorGeneral

- (id)initFSRequestorGeneral
{
	return self;
}

#pragma mark -
#pragma mark Settings All API Request
- (NSDictionary *)allSettingsAPIRequest
{	
	NSDictionary *settingsAllDict = [FSURLRequest URLString:@"settings/all?" dictionaryKey:@"settingsDictionary" httpMethod:@"GET"];
	
	return settingsAllDict;
}


@end
