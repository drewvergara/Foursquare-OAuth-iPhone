//
//  FSSettingsRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import "FSSettingsRequestor.h"
#import "FSURLRequest.h"
#import "FSSettingsRequestorGeneral.h"

@implementation FSSettingsRequestor

#pragma mark -
#pragma mark Create instance of FSSettingsRequestor
- (id)initFSSettingsRequestor
{
	if (self = [super init])
	{
		
	}
	
    return self;
}

#pragma mark -
#pragma mark Settings Information
- (NSDictionary *)getSettingsInfo:(NSString *)tipID
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSDictionary *settingsDict = [FSURLRequest URLString:@"settings/all?" dictionaryKey:@"settingsDictionary" httpMethod:@"GET"];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return settingsDict;
}

#pragma mark -
#pragma mark Settings General API Request
- (NSDictionary *)generalSettingsAPIRequest:(NSString *)type
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSSettingsRequestorGeneral *generalRequestor = [[FSSettingsRequestorGeneral alloc] initFSRequestorGeneral];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"add"]) {
		requestDict = [generalRequestor allSettingsAPIRequest];
	}
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}

@end
