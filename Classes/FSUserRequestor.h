//
//  FSUserRequestor.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/22/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSUserRequestor : NSObject {
	NSObject *requestor;
	SEL requestorCallback;

	NSMutableData *responseData;
}
@property (nonatomic, retain) NSMutableData *responseData;

- (id)initForFoursquare:(NSObject *)caller callback:(SEL)callback;
- (void)getUserInfo:(NSString *)token;

@end
