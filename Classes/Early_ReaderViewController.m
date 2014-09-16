//
//  Early_ReaderViewController.m
//  Early Reader
//
//  Created by idomechi on 8/8/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Early_ReaderViewController.h"

@implementation Early_ReaderViewController




// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


-(void)showMenu:(NSTimer*)theTimer
{
	[splash removeFromSuperview];
	[self.view addSubview:menu];
	[menu release];
}


/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 
 }
 */




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	menu = [[MainMenu alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
	splash= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
	[self.view addSubview:splash];
	[splash release];
	[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(showMenu:) userInfo:nil repeats:NO];
    
	[super viewDidLoad];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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
	[self.view removeFromSuperview];
    [super dealloc];
}

@end
