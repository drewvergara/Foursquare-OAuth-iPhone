//
//  FSVenueRequestorActions.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSVenueRequestorActions : NSObject {

}

- (id)initFSRequestorActions;
- (NSDictionary *)marktodoVenueAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)flagVenueAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)proposeeditVenueAPIRequest:(NSDictionary *)queryData;
@end
