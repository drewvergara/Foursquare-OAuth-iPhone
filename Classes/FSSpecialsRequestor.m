//
//  FSSpecialsRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import "FSSpecialsRequestor.h"
#import "FSURLRequest.h"
#import "FSSpecialsRequestorGeneral.h"

@implementation FSSpecialsRequestor

#pragma mark -
#pragma mark Create instance of FSSpecialsRequestor
- (id)initFSSpecialsRequestor
{
	if (self = [super init])
	{
		
	}
	
    return self;
}

#pragma mark -
#pragma mark Specials Information
- (NSDictionary *)getSpecialsInfo:(NSString *)specialID
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSDictionary *specialsDict = [FSURLRequest URLString:[NSString stringWithFormat:@"specials/%@?", specialID] dictionaryKey:@"sepcialsDictionary" httpMethod:@"GET"];;
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return specialsDict;
}

#pragma mark -
#pragma mark Specials General API Request
- (NSDictionary *)generalSettingsAPIRequest:(NSString *)type
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSSpecialsRequestor *generalRequestor = [[FSSpecialsRequestor alloc] initFSRequestorGeneral];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"search"]) {
		requestDict = [generalRequestor allSettingsAPIRequest];
	}
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}

@end
