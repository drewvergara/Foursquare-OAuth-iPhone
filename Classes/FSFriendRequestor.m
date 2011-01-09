//
//  FSFriendRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/29/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FSFriendRequestor.h"
#import "JSON.h"

@implementation FSFriendRequestor

@synthesize friendDictionary, friends,numberOfFriends;

- (id)initFSFriendRequestor:(NSString *)userToken
{
	if (self = [super init])
	{
		[self getFriendInfo:userToken];
	}
	
    return self;
}

- (void)getFriendInfo:(NSString *)token
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSHTTPURLResponse *response = nil;
	NSError *error = nil;
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	NSURL *nsurl = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.foursquare.com/v2/users/self/friends?oauth_token=%@", token]];
	[request setURL:nsurl];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/text" forHTTPHeaderField:@"content-type"];
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];	
	
	NSString *results = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
	NSLog(@"%@", [NSString stringWithFormat:@"Request data: %@", results]);	
	
	//Create a dictionary with the data
	NSMutableDictionary *dicResponse = [[NSMutableDictionary alloc] init];
	SBJsonParser *json = [SBJsonParser new];
	NSDictionary *dicJSON = [json objectWithString:results error:&error];
	if (nil == dicJSON){
		NSLog(@"JSON parsing failed: %@",[error localizedDescription]);
		[dicResponse setObject:[NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]] forKey:@"error"];
	}else{
		[dicResponse setObject:dicJSON forKey:@"friendDictionary"];
	}
	
	[self disectFriendInfo:dicResponse];	
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)disectFriendInfo:(NSDictionary *)dict
{
	NSDictionary *info = [dict objectForKey:@"friendDictionary"];
	NSDictionary *response = [info objectForKey:@"response"];
	NSDictionary *friendsDict = [response objectForKey:@"friends"];
	
	self.friendDictionary = friendsDict;
	self.friends = [friendsDict objectForKey:@"items"];
	self.numberOfFriends = [friendsDict objectForKey:@"count"];
}

@end
