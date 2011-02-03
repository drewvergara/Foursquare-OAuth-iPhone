//
//  FSURLRequest.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/18/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSURLRequest : NSObject {

}
+ (NSDictionary *)URLString:(NSString*)url dictionaryKey:(NSString *)key httpMethod:(NSString *)method;
+ (NSDictionary *)URLString:(NSString*)url dictionaryKey:(NSString *)key httpMethod:(NSString *)method withPOSTData:(NSString *)data;
@end
