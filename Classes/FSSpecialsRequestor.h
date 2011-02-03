//
//  FSSpecialsRequestor.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSSpecialsRequestor : NSObject {

}

- (id)initFSSpecialsRequestor;
- (NSDictionary *)getSpecialsInfo:(NSString *)specialID;
- (NSDictionary *)generalSettingsAPIRequest:(NSString *)type;

@end
