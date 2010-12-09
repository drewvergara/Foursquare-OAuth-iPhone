//
//  FoursquareConnectViewController.m
//  FoursquareConnect
//
//  Created by Andrew Vergara on 12/7/10.
//  Copyright 2010 72andSunny. All rights reserved.
//

#import "FoursquareConnectViewController.h"
#import "FSConnectWebView.h"

@implementation FoursquareConnectViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
	
	//This is both temporary and for demo purposes.  Eventually, this will change.
	//We must pass a referece of this object to FSConnect and what function to callback once the token is retrieved.
	FSConnectWebView *connectView = [[FSConnectWebView alloc] initWithNibName:@"FSConnectWebView" bundle:[NSBundle mainBundle] caller:self callback:@selector(storeFoursquareToken:)];
	[self.view addSubview:connectView.view];
	
}

//This is the callback called when foursquare has returned the OAuth token.
- (void)storeFoursquareToken:(NSString *)token
{
	
	if (token != nil) {
		NSLog(@"access_token = %@", token);
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You have connected to Foursquare." message:[NSString stringWithFormat:@"access_token = %@", token] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert release];		
	}else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You have not connected to Foursquare." message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert release];		
	}

	
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
