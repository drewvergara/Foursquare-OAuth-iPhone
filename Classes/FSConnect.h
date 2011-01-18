//
//  FSConnect.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/28/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSConnect : NSObject {
	NSObject *requestor;
	SEL requestorCallback;
	
	NSString *securityToken;
}
@property (nonatomic, retain) NSString *securityToken;

- (id)initForFoursquare:(NSObject *)caller callback:(SEL)callback securityToken:(NSString *)token;
- (void)getUserData:(NSString *)token;

@end
