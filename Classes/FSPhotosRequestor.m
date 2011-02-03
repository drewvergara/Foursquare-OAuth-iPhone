//
//  FSPhotosRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSPhotosRequestor.h"
#import "FSURLRequest.h"
#import "FSPhotosRequestorGeneral.h"

@implementation FSPhotosRequestor

#pragma mark -
#pragma mark Create instance of FSPhotosRequestor
- (id)initFSPhotosRequestor
{
	if (self = [super init])
	{
		
	}
	
    return self;
}

#pragma mark -
#pragma mark Photos Information
- (NSDictionary *)getPhotosInfo:(NSString *)photoID
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSDictionary *photosDict = [FSURLRequest URLString:[NSString stringWithFormat:@"photos/%@?", photoID] dictionaryKey:@"photosDictionary" httpMethod:@"GET"];
	
	//[self disectVenueInfo:venueDict];	
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return photosDict;
}

#pragma mark -
#pragma mark Photos General API Request
- (NSDictionary *)generalPhotosAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	FSPhotosRequestorGeneral *generalRequestor = [[FSPhotosRequestorGeneral alloc] initFSRequestorGeneral];
	NSDictionary *requestDict;
	
	if ([type isEqualToString:@"add"]) {
		requestDict = [generalRequestor addPhotoAPIRequest:data];
	}else {
		requestDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Bad Request", @"error", nil];
	}
		
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return requestDict;
}

@end