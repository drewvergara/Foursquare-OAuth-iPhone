//
//  FSURLRequest.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/18/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import "FSURLRequest.h"
#import "FSConnect.h"
#import "JSON.h"

@implementation FSURLRequest

#pragma mark -
#pragma mark URL Connection to Foursquare
+ (NSDictionary *)URLString:(NSString*)url dictionaryKey:(NSString *)key httpMethod:(NSString *)method
{
	NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"fsSecurityToken"];
	
	NSHTTPURLResponse *response = nil;
	NSError *error = nil;

	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	NSURL *nsurl = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.foursquare.com/v2/%@oauth_token=%@", url, token]];
	[request setURL:nsurl];
	[request setHTTPMethod:@"GET"];
	[request setHTTPMethod:method];
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
		[dicResponse setObject:dicJSON forKey:key];
	}
	
	return dicResponse;
}
@end
