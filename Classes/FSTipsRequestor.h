//
//  FSTipsRequestor.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSTipsRequestor : NSObject {

}

- (id)initFSTipsRequestor;
- (NSDictionary *)getTipsInfo:(NSString *)tipID;
- (NSDictionary *)generalTipsAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data;
- (NSDictionary *)actionsTipsAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data;

@end
