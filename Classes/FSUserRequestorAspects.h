//
//  FSUserRequestorAspects.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/18/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSUserRequestorAspects : NSObject {

}

- (id)initFSRequestorAspects;
- (NSDictionary *)badgesUserAPIRequest:(NSString *)userID;
- (NSDictionary *)checkinsUserAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)friendsUserAPIRequest:(NSString *)userID;
- (NSDictionary *)tipsUserAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)todosUserAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)venuehistoryUserAPIRequest:(NSString *)userID;
@end
