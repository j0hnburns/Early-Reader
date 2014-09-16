//
//  Early_ReaderAppDelegate.m
//  Early Reader
//
//  Created by idomechi on 8/8/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Early_ReaderAppDelegate.h"
#import "Early_ReaderViewController.h"

@implementation Early_ReaderAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
