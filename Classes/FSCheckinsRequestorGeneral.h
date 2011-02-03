//
//  FSCheckinsRequestorGeneral.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011 72andSunny. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSCheckinsRequestorGeneral : NSObject {

}

- (id)initFSRequestorGeneral;
- (NSDictionary *)addCheckinAPIRequest:(NSDictionary *)queryData;
- (NSDictionary *)recentCheckinAPIRequest:(NSDictionary *)queryData;

@end
