//
//  FSConnect.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/28/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FSConnect.h"
#import "FSUserRequestor.h"
#import "FSFriendRequestor.h"
#import "FSVenueRequestor.h"

@implementation FSConnect

@synthesize securityToken;

- (id)initForFoursquare:(NSObject *)caller callback:(SEL)callback securityToken:(NSString *)token
{
	if (self = [super init])
	{
		self.securityToken = token;
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
	FSUserRequestor *fsUser = [[FSUserRequestor alloc] initFSUserRequest];
	[fsUser getUserInfo:@"self"];
	//[fsUser searchUserInfo:@"drewvergara" searchType:@"twitter" securityToken:token];
//	NSLog(@"userDictionary: %@", fsUser.userDictionary);
//	NSLog(@"userFullName: %@", fsUser.fullName);
//	NSLog(@"userID: %@", fsUser.userID);
//	NSLog(@"userPhoto: %@", fsUser.userPhotoURL);
//	NSLog(@"userHome: %@", fsUser.userHomeCity);
	
//	FSFriendRequestor *fsFriends = [[FSFriendRequestor alloc] initFSFriendRequestor:token];
//	NSLog(@"friendDictionary: %@", fsFriends.friendDictionary);
//	NSLog(@"friends: %@", fsFriends.friends);
//	NSLog(@"friendCount: %@", fsFriends.numberOfFriends);
	
//	FSVenueRequestor *fsVenue = [[FSVenueRequestor alloc] fsVenueRequestor:token];
//	NSLog(@"favoriteNearbyVenues: %@", fsVenue.favoriteVenueItems);
//	NSLog(@"nearbyVenues: %@", fsVenue.nearbyVenueItems);
	
}

@end
