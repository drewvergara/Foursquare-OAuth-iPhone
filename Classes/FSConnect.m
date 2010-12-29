//
//  FSConnect.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/28/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FSConnect.h"
#import "FSUserRequestor.h"

@implementation FSConnect

- (id)initForFoursquare:(NSObject *)caller callback:(SEL)callback
{
	if (self = [super init])
	{
		// Initialization code
		requestor = caller;
		if (requestor)
			[requestor retain];  //Retain the requestor in case it gets popped off while being retrieved (or go 'boom').
		requestorCallback = callback;
		
		//self.responseData = [NSMutableData data];  
	}
    return self;
}

- (void)getUserData:(NSString *)token
{
	FSUserRequestor *fsUser = [[FSUserRequestor alloc] initFSUserRequestor:self  token:token callback:@selector(saveUserInfo:)];
	NSLog(@"dictionary: %@", fsUser.userDictionary);
	//NSDictionary *stuff = [fsUser getUserInfo:token];
	
	//NSLog(@"stuff: %@", stuff);
}

- (void)saveUserInfo:(FSUserRequestor *)userInfo
{
//	NSLog(@"saved: %@", userInfo);
//	NSLog(@"dictionary: %@", userInfo.userDictionary);
//	NSLog(@"checkins info: %@", userInfo.checkins);
//	NSLog(@"contact info: %@", userInfo.contact);
//	NSLog(@"friends info: %@", userInfo.friends);
//	NSLog(@"mayorships info: %@", userInfo.mayorships);	
}

@end
