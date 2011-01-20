//
//  FSUserRequestorActions.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/18/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSUserRequestorActions : NSObject {

}

- (id)initFSRequestorActions;
- (NSDictionary *)requestUserAPIRequest:(NSString *)userID;
- (NSDictionary *)unfriendUserAPIRequest:(NSString *)userID;
- (NSDictionary *)approveUserAPIRequest:(NSString *)userID;
- (NSDictionary *)denyUserAPIRequest:(NSString *)userID;
- (NSDictionary *)setpingsUserAPIRequest:(NSDictionary *)queryData;
@end
