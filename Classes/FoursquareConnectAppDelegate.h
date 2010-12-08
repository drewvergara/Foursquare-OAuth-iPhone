//
//  FoursquareConnectAppDelegate.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FoursquareConnectViewController;

@interface FoursquareConnectAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FoursquareConnectViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FoursquareConnectViewController *viewController;

@end

