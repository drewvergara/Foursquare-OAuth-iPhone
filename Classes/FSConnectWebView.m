//
//  FSConnectWebView.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/7/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FSConnectWebView.h"
#import "FSUserRequestor.h"

@implementation FSConnectWebView

@synthesize loginView, activityIndicator, foursquareOverlay, foursquareToken, jsWebview;

///////////////////////////////////////////////////////////////////////////////////////////////////
//This application will not work until you enter your Foursquare application's API key and callback URL
static NSString *clientID = @"FWILH0ZTEEEYKNFDTGYCTV1HNW002DBSEJFPDCORZL3SEGJ5";
static NSString *dummyRedirect = @"http://www.imaginepixel.com";

///////////////////////////////////////////////////////////////////////////////////////////////////



#pragma mark -
#pragma mark View Lifecycle

/*
 Create the webview with the necessary URL.  The correct URL should be:
 https://foursquare.com/oauth2/authenticate?client_id=CLIENT_ID&response_type=token&redirect_uri=YOUR_REGISTERED_REDIRECT_URI&display=touch

 However, since Foursquare APIv2 is currently in beta using the display=touch does not work.
 As a work around this URL will work:
 https://foursquare.com/touch/login?continue=/oauth2/authenticate?client_id=CLIENT_ID&response_type=token&redirect_uri=YOUR_REGISTERED_REDIRECT_URI
 
 */

// The designated initializer.  We need a reference to the object that initialized the class and the method to callback on that object
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil caller:(NSObject *)caller callback:(SEL)callback {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		requestor = caller;
		if (requestor)
			[requestor retain];  //Retain the requestor in case it gets popped off while being retrieved (or go 'boom').
		requestorCallback = callback;		
	}
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	loginView.alpha = 0.0;
	
	loginView.delegate = self;
	loginView.scalesPageToFit = YES;
	NSString *urlWithIDandDummyRedirect = @"https://foursquare.com/touch/login?continue=/oauth2/authenticate%3Fclient_id%3D";
	urlWithIDandDummyRedirect = [urlWithIDandDummyRedirect stringByAppendingString:clientID];
	urlWithIDandDummyRedirect = [urlWithIDandDummyRedirect stringByAppendingString:@"%26response_type%3Dtoken%26display%3Dtouch%26redirect_uri%3D"];
	urlWithIDandDummyRedirect = [urlWithIDandDummyRedirect stringByAppendingString:dummyRedirect];
	NSURL *url = [NSURL URLWithString:urlWithIDandDummyRedirect];
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	
	[loginView loadRequest:req];
	
	[self constructOverlay];
	[self constructCloseBtn];
	
	jsWebview = [[UIWebView alloc] init];
	jsWebview.delegate = self;	
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
/*
 We are constructing an UIImageView Overlay.  This is purely for aesthetical purposes.  
 Since the app is already on the phone it doesn't make sense to show users the redirect URL.
 Thus, we are showing an overlay when a redirect occurs and we remove the webview when we get the access_token
 */
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
	[self toggleOAuthComponent:YES];	
}	

- (void)hideOverlay
{
	foursquareOverlay.hidden = YES;
}


#pragma mark Construct Cancel/Close Button
- (void)constructCloseBtn
{
	UIImage *closeImage = [UIImage imageNamed:@"fs-close-btn.png"];
	UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
	closeButton.frame = CGRectMake(5, 5, closeImage.size.width * 0.5, closeImage.size.height * 0.5);
	[closeButton setBackgroundImage:closeImage forState:UIControlStateNormal];
	[closeButton setContentMode:UIViewContentModeScaleToFill];
	[closeButton addTarget:self action:@selector(cancelLogin:) forControlEvents:UIControlEventTouchUpInside];

	[self.view insertSubview:closeButton atIndex:3];
}

- (void)cancelLogin:(id)sender
{
	NSLog(@"Canceled Foursquare Login");
	[self toggleOAuthComponent:NO];
	loginView.hidden = YES;
	
	[requestor performSelector:requestorCallback withObject:nil];
}


#pragma mark WebView Reactions

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

	NSLog(@"Current URL: %@", currentURL.absoluteString);
	
	if ([dummyURL isEqualToString:dummyRedirect]) {
		[self toggleOAuthComponent:NO];
		NSString *token = [splitURL objectAtIndex:1];
		[self writeTokenToLocalStorage:token];		
		loginView.hidden = YES;
		[requestor performSelector:requestorCallback withObject:token];		
		
		return;
	}
		
	[self hideOverlay];
}

- (void)toggleOAuthComponent:(BOOL)show
{
	NSString *animationType;
	float alphaValue;

	if (show) {
		animationType = @"addComponent";
		alphaValue = 1.0;
	}else {
		animationType = @"removeComponent";
		alphaValue = 0.0;		
	}

	
	[UIView beginAnimations:animationType context:nil];
	[UIView setAnimationDelay:0.5];
	[UIView setAnimationDuration:0.35];	
	[UIView setAnimationDelegate:self];	
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	
	loginView.alpha = alphaValue;
	foursquareOverlay.alpha = alphaValue;
	
	[UIView commitAnimations];	
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
	if ([animationID isEqualToString:@"removeComponent"]) {		
		[loginView removeFromSuperview];
		[self.view removeFromSuperview];
	}
}

//Doing this because I want to.  Still trying firgure out what exactly I want to do with this.
- (void)writeTokenToLocalStorage:(NSString *)fsToken
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"storage" ofType:@"js"];
	NSData *jsData = [NSData dataWithContentsOfFile:filePath];
	NSString *results = [[NSString alloc] initWithData:jsData encoding:NSUTF8StringEncoding];
		
	NSString *dataWithToken = [NSString stringWithFormat:@"%@%@", results];
	[loginView stringByEvaluatingJavaScriptFromString:dataWithToken];
	
	NSString *insertToken = [NSString stringWithFormat:@"saveTokenOnLocalStorage('%@');", fsToken];
	NSString *tokenInLocalStorage = [loginView stringByEvaluatingJavaScriptFromString:insertToken];	
	
	NSLog(@"js return: %@", tokenInLocalStorage);
	
	FSUserRequestor *getInfo = [[FSUserRequestor alloc] initForFoursquare:self callback:nil];
	[getInfo getUserInfo:tokenInLocalStorage];
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
	[requestor release];
}


@end
