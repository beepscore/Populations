//
//  PopulationsAppDelegate.m
//  Populations
//
//  Created by Steve Baker on 1/17/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import "PopulationsAppDelegate.h"
#import "RootViewController.h"


@implementation PopulationsAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

