//
//  FSVenueRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/12/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSVenueRequestor.h"
#import "JSON.h"

@implementation FSVenueRequestor

@synthesize venueDictionary, favoriteVenueItems, nearbyVenueItems;

- (id)initFSVenueRequestor:(NSString *)userToken
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
	
	NSHTTPURLResponse *response = nil;
	NSError *error = nil;
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	NSURL *nsurl = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?ll=%@&oauth_token=%@", latLong, token]];
	[request setURL:nsurl];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/text" forHTTPHeaderField:@"content-type"];
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];	
	
	NSString *results = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
	NSLog(@"%@", [NSString stringWithFormat:@"Request data: %@", results]);	
	
	//Create a dictionary with the data
	NSMutableDictionary *dicResponse = [[NSMutableDictionary alloc] init];
	SBJsonParser *json = [SBJsonParser new];
	NSDictionary *dicJSON = [json objectWithString:results error:&error];
	if (nil == dicJSON){
		NSLog(@"JSON parsing failed: %@",[error localizedDescription]);
		[dicResponse setObject:[NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]] forKey:@"error"];
	}else{
		[dicResponse setObject:dicJSON forKey:@"venueDictionary"];
	}
	
	[self disectVenueInfo:dicResponse];	
	
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
