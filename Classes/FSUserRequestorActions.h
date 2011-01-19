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
- (NSDictionary *)requestUserAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)unfriendUserAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)approveUserAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)denyUserAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)setpingsUserAPIRequest:(NSDictionary *)queryData;
@end
