//
//  FSPhotosRequestorGeneral.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 1/20/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FSPhotosRequestorGeneral : NSObject {

}

- (id)initFSRequestorGeneral;
- (NSDictionary *)addPhotoAPIRequest:(NSDictionary *)queryData;

@end
