//
//  FSTipsRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSTipsRequestor.h"
#import "FSURLRequest.h"

@implementation FSTipsRequestor

#pragma mark -
#pragma mark Create instance of FSTipsRequestor
- (id)initFSTipsRequestor
{
	if (self = [super init])
	{
		
	}
	
    return self;
}

#pragma mark -
#pragma mark Tips Information
- (NSDictionary *)getTipsInfo:(NSString *)tipID
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

	NSDictionary *tipsDict = [FSURLRequest URLString:[NSString stringWithFormat:@"tips/%@?", tipID] dictionaryKey:@"tipsDictionary" httpMethod:@"GET"];

	//[self disectVenueInfo:venueDict];	

	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

	return tipsDict;
}

@end
