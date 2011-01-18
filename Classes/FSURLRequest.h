//
//  FSURLRequest.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/18/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSURLRequest : NSObject {

}
+ (NSDictionary *)URLString:(NSString*)url dictionaryKey:(NSString *)key httpMethod:(NSString *)method;
@end
