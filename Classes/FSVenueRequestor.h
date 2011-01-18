//
//  FSVenueRequestor.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/12/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSVenueRequestor : NSObject {
	NSDictionary *venueDictionary;
	NSArray *favoriteVenueItems;
	NSArray *nearbyVenueItems;
}
@property (nonatomic, retain) NSDictionary *venueDictionary;
@property (nonatomic, retain) NSArray *favoriteVenueItems;
@property (nonatomic, retain) NSArray *nearbyVenueItems;

- (id)fsVenueRequest:(NSString *)userToken;
- (void)getNearbyVenueInfo:(NSString *)token latitudeAndLongitude:(NSString *)latLong;
- (void)disectVenueInfo:(NSDictionary *)dict;
@end
