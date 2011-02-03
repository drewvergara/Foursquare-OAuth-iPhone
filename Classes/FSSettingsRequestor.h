//
//  FSSettingsRequestor.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSSettingsRequestor : NSObject {

}

- (id)initFSSettingsRequestor;
- (NSDictionary *)getSettingsInfo:(NSString *)tipID;
- (NSDictionary *)generalSettingsAPIRequest:(NSString *)type;

@end