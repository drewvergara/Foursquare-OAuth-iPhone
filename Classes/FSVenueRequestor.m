//
//  FSVenueRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/12/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSVenueRequestor.h"
#import "FSURLRequest.h"

@implementation FSVenueRequestor

@synthesize venueDictionary, favoriteVenueItems, nearbyVenueItems;

- (id)fsVenueRequest:(NSString *)userToken
{
	if (self = [super init])
	{
		[self getNearbyVenueInfo:userToken latitudeAndLongitude:@"33.980478,-118.397191"];
	}
	
    return self;
}

- (void)getNearbyVenueInfo:(NSString *)token latitudeAndLongitude:(NSString *)latLong
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

	NSDictionary *venueDict = [FSURLRequest URLString:[NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?ll=%@&oauth_token=%@", latLong, token] dictionaryKey:@"venueDictionary" httpMethod:@"GET"];
	
	[self disectVenueInfo:venueDict];	
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
}

- (void)disectVenueInfo:(NSDictionary *)dict
{
	NSDictionary *info = [dict objectForKey:@"venueDictionary"];
	NSDictionary *response = [info objectForKey:@"response"];
	NSArray *groups = [response objectForKey:@"groups"];
	
	for (int i = 0; i < [groups count]; i++) {
		NSDictionary *groupItems = [groups objectAtIndex:i];
		NSString *venueType = [groupItems objectForKey:@"type"];

		if ([venueType isEqualToString:@"favorites"]) {
			self.favoriteVenueItems = [groupItems objectForKey:@"items"];
		}
		
		if ([venueType isEqualToString:@"nearby"]) {
			self.nearbyVenueItems = [groupItems objectForKey:@"items"];
		}
		
		
	}
}


@end
