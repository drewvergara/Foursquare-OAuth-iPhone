//
//  FSCheckinsRequestor.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSCheckinsRequestor : NSObject {

}

- (id)initFSCheckinsRequest;
- (NSDictionary *)getCheckinsInfo:(NSString *)venueID;
- (NSDictionary *)generalCheckinAPIRequest:(NSString *)type;
- (NSDictionary *)generalCheckinAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data;
@end