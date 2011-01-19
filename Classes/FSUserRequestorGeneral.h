//
//  FSUserRequestorGeneral.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/18/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSUserRequestorGeneral : NSObject {

}

- (id)initFSRequestorGeneral;
- (NSDictionary *)searchUserAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)requestsUserAPIRequest;
@end
