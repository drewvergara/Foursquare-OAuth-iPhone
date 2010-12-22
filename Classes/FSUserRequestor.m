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

@synthesize responseData;

- (id)initForFoursquare:(NSObject *)caller callback:(SEL)callback
{
	if (self = [super init])
	{
		// Initialization code
		requestor = caller;
		if (requestor)
			[requestor retain];  //Retain the requestor in case it gets popped off while being retrieved (or go 'boom').
		requestorCallback = callback;
		
		self.responseData = [NSMutableData data];  
	}
    return self;
}

- (void)getUserInfo:(NSString *)token
{
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	NSURL *nsurl = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.foursquare.com/v2/users/self?oauth_token=%@", token]];
	[request setURL:nsurl];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/text" forHTTPHeaderField:@"content-type"];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {	
	[self.responseData setLength:0];
	
	NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
	int responseStatusCode = [httpResponse statusCode];
	NSLog(@"%@", [NSString stringWithFormat:@"Request status code: %d", responseStatusCode]);	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {	
	[self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"%@", [NSString stringWithFormat:@"Request error: %@", [error localizedDescription]]);
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	NSString *results = [[[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding] autorelease];  // NSASCIIStringEncoding  
	NSLog(@"%@", [NSString stringWithFormat:@"Request data: %@", results]);

	
	//Create a dictionary with the data
	NSMutableDictionary *dicResponse = [[NSMutableDictionary alloc] init];
	NSError *error = nil;
	SBJsonParser *json = [SBJsonParser new];
	NSDictionary *dicJSON = [json objectWithString:results error:&error];
	if (nil == dicJSON){
		NSLog(@"JSON parsing failed: %@",[error localizedDescription]);
		[dicResponse setObject:[NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]] forKey:@"error"];
	}else{
		[dicResponse setObject:dicJSON forKey:@"userDictionary"];
	}
	
	NSLog(@"Dictionary: %@", dicResponse);
	
	
	//[requestor performSelector:requestorCallback withObject:results];
	[requestor release];
}


@end
