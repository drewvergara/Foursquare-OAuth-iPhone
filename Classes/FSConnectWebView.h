//
//  FSConnectWebView.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/7/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FSConnectWebView : UIViewController <UIWebViewDelegate>{
	IBOutlet UIWebView *loginView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	
	UIImageView *foursquareOverlay;
}

@property (nonatomic, retain) IBOutlet UIWebView *loginView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) UIImageView *foursquareOverlay;

- (void)constructOverlay;
- (void)showOverlay;
- (void)hideOverlay;

@end
