//
//  FSSpecialsRequestorGeneral.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSSpecialsRequestorGeneral : NSObject {

}

- (id)initFSRequestorGeneral;
- (NSDictionary *)searchSpecialsAPIRequest:(NSDictionary *)queryData;

@end