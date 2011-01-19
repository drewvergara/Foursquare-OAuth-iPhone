//
//  FSUserRequestor.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/22/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSUserRequestor : NSObject {
	NSString *securityToken;
	
	NSObject *requestor;
	SEL requestorCallback;

	NSMutableData *responseData;
	
	NSDictionary *userDictionary;
	NSDictionary *checkins;
	NSDictionary *contact;
	NSDictionary *friends;
	NSDictionary *mayorships;
	
	NSString *userID;
	NSString *userPhotoURL;

	NSString *fullName;
	NSString *firstName;
	NSString *lastName;	
	NSString *userGender;
	NSString *userHomeCity;		
}
@property (nonatomic, retain) NSString *securityToken;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSDictionary *userDictionary;
@property (nonatomic, retain) NSDictionary *checkins;
@property (nonatomic, retain) NSDictionary *contact;
@property (nonatomic, retain) NSDictionary *friends;
@property (nonatomic, retain) NSDictionary *mayorships;

@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) NSString *userPhotoURL;

@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *userGender;
@property (nonatomic, retain) NSString *userHomeCity;


- (id)initFSUser;
- (NSDictionary *)getUserInfo:(NSString *)user;
- (NSDictionary *)generalUserAPIRequest:(NSString *)type;
- (NSDictionary *)generalUserAPIRequest:(NSString *)type withRequestData:(NSDictionary *)data;
- (void)disectUserInfo:(NSDictionary *)dict;

@end
