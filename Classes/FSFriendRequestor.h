//
//  FSFriendRequestor.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/29/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSFriendRequestor : NSObject {

	NSDictionary *friendDictionary;
	
}
@property (nonatomic, retain) NSDictionary *friendDictionary;

- (id)initFSFriendRequestor:(NSString *)userToken;
- (void)getFriendInfo:(NSString *)token;
- (void)disectFriendInfo:(NSDictionary *)dict;

@end
