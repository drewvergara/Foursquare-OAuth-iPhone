//
//  FSConnectWebView.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/7/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FSConnectWebView.h"


@implementation FSConnectWebView

@synthesize loginView, activityIndicator, foursquareOverlay;

static NSString *clientID = @"FWILH0ZTEEEYKNFDTGYCTV1HNW002DBSEJFPDCORZL3SEGJ5";
static NSString *dummyRedirect = @"http://www.imaginepixel.com";

#pragma mark -
#pragma mark View Lifecycle

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */

- (void)viewDidLoad {
    [super viewDidLoad];
	
	loginView.delegate = self;
	loginView.scalesPageToFit = YES;
	NSString *urlWithIDandDummyRedirect = @"https://foursquare.com/touch/login?continue=/oauth2/authenticate%3Fclient_id%3D";
	urlWithIDandDummyRedirect = [urlWithIDandDummyRedirect stringByAppendingString:clientID];
	urlWithIDandDummyRedirect = [urlWithIDandDummyRedirect stringByAppendingString:@"%26response_type%3Dtoken%26display%3Dtouch%26redirect_uri%3D"];
	urlWithIDandDummyRedirect = [urlWithIDandDummyRedirect stringByAppendingString:dummyRedirect];
	NSURL *url = [NSURL URLWithString:urlWithIDandDummyRedirect];
	//@"https://foursquare.com/touch/login?continue=/oauth2/authenticate%3Fclient_id%3DLY3ANXJ015OMH4XHGEX3TDQQQDPZGHNNXISKQ4ACDHLS5TFY%26response_type%3Dtoken%26display%3Dtouch%26redirect_uri%3Dhttp://imaginepixel.com"	
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	
	[loginView loadRequest:req];
	
	[self constructOverlay];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
	activityIndicator.hidden = NO;
	[activityIndicator startAnimating];
	
	[self showOverlay];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
	activityIndicator.hidden = YES;
	[activityIndicator stopAnimating];

	NSURLRequest *currentRequest = [webView request];
	NSURL *currentURL = [currentRequest URL];
	NSString *currentURLString = currentURL.absoluteString;
	NSArray *splitURL = [currentURLString componentsSeparatedByString:@"/#access_token="];
	NSString *dummyURL = [splitURL objectAtIndex:0];
	
	
	if ([dummyURL isEqualToString:dummyRedirect]) {
		[loginView removeFromSuperview];
		NSString *token = [splitURL objectAtIndex:1];
		NSLog(@"access_token = %@", token);
	}
	
	
	NSLog(@"Current URL is %@", currentURL.absoluteString);
	
	
	
	[self hideOverlay];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


# pragma mark -
# pragma mark Overlay Image

- (void)constructOverlay
{
	UIImage *overlayImage = [UIImage imageNamed:@"foursquare-overlay.png"];
	foursquareOverlay = [[UIImageView alloc] initWithImage:overlayImage];
	foursquareOverlay.frame = CGRectMake(0, 0, 320, 480);
	[foursquareOverlay setContentMode:UIViewContentModeScaleAspectFit];
	[foursquareOverlay autorelease];
	//[self.view addSubview:foursquareOverlay];
	[self.view insertSubview:foursquareOverlay atIndex:1];
	
	foursquareOverlay.hidden = YES;
}

- (void)showOverlay
{
	foursquareOverlay.hidden = NO;
}	

- (void)hideOverlay
{
	foursquareOverlay.hidden = YES;
}

#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)dealloc {
    [super dealloc];
	[loginView release];
	[activityIndicator release];
}


@end
