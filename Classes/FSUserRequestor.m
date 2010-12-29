//
//  FSUserRequestor.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/22/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FSUserRequestor.h"
#import "JSON.h"

@implementation FSUserRequestor

@synthesize responseData, userDictionary, checkins, contact, friends, mayorships;

- (id)initFSUserRequestor:(NSObject *)caller token:(NSString *)userToken callback:(SEL)callback
{
	if (self = [super init])
	{
		// Initialization code
		requestor = caller;
		if (requestor)
			[requestor retain];  //Retain the requestor in case it gets popped off while being retrieved (or go 'boom').
		requestorCallback = callback;
	}
	
	NSDictionary *user = [self getUserInfo:userToken];
	
    return self;
}

- (NSDictionary *)getUserInfo:(NSString *)token
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSHTTPURLResponse *response = nil;
	NSError *error = nil;
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	NSURL *nsurl = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.foursquare.com/v2/users/self?oauth_token=%@", token]];
	[request setURL:nsurl];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/text" forHTTPHeaderField:@"content-type"];
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];	
	
	NSString *results = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];  // NSASCIIStringEncoding  
	NSLog(@"%@", [NSString stringWithFormat:@"Request data: %@", results]);	
	
	//Create a dictionary with the data
	NSMutableDictionary *dicResponse = [[NSMutableDictionary alloc] init];
	SBJsonParser *json = [SBJsonParser new];
	NSDictionary *dicJSON = [json objectWithString:results error:&error];
	if (nil == dicJSON){
		NSLog(@"JSON parsing failed: %@",[error localizedDescription]);
		[dicResponse setObject:[NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]] forKey:@"error"];
	}else{
		[dicResponse setObject:dicJSON forKey:@"userDictionary"];
	}
	
	self.userDictionary = dicResponse;
	
	//NSLog(@"Dictionary: %@", dicResponse);	
	[self disectUserInfo:dicResponse];	
	
//	[requestor performSelector:requestorCallback withObject:self];
	[requestor release];

	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return self.userDictionary;
}

- (void)disectUserInfo:(NSDictionary *)dict
{
	NSDictionary *info = [dict objectForKey:@"userDictionary"];
	NSDictionary *response = [info objectForKey:@"response"];
	NSDictionary *user = [response objectForKey:@"user"];
	self.checkins = [user objectForKey:@"checkins"];
	self.contact = [user objectForKey:@"contact"];
	self.friends = [user objectForKey:@"friends"];
	self.mayorships = [user objectForKey:@"mayorships"];
	
//	NSLog(@"checkins info: %@", checkins);
//	NSLog(@"contact info: %@", contact);
//	NSLog(@"friends info: %@", friends);
//	NSLog(@"mayorships info: %@", mayorships);
}


@end
