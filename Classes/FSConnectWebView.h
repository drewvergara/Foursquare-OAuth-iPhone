//
//  FSConnectWebView.h
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/7/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FSConnectWebView : UIViewController <UIWebViewDelegate>{
	NSObject *requestor;
	SEL requestorCallback;
	
	IBOutlet UIWebView *loginView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	
	UIImageView *foursquareOverlay;
	
	NSString *foursquareToken;
	
	
	UIWebView *jsWebview;
}

@property (nonatomic, retain) IBOutlet UIWebView *loginView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) UIImageView *foursquareOverlay;
@property (nonatomic, retain) NSString *foursquareToken;
@property (nonatomic, retain) UIWebView *jsWebview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil caller:(NSObject *)caller callback:(SEL)callback;
- (void)constructOverlay;
- (void)constructCloseBtn;
- (void)showOverlay;
- (void)hideOverlay;
- (void)toggleOAuthComponent:(BOOL)show;
- (void)writeTokenToLocalStorage:(NSString *)fsToken;

@end
