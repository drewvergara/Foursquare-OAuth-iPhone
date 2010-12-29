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
	
	NSDictionary *userDictionary;
	NSDictionary *checkins;
	NSDictionary *contact;
	NSDictionary *friends;
	NSDictionary *mayorships;
	
}
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSDictionary *userDictionary;
@property (nonatomic, retain) NSDictionary *checkins;
@property (nonatomic, retain) NSDictionary *contact;
@property (nonatomic, retain) NSDictionary *friends;
@property (nonatomic, retain) NSDictionary *mayorships;

- (id)initFSUserRequestor:(NSObject *)caller token:(NSString *)userToken callback:(SEL)callback;
- (NSDictionary *)getUserInfo:(NSString *)token;
- (void)disectUserInfo:(NSDictionary *)dict;

@end
