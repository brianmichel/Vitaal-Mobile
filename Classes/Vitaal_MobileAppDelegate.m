//
//  Vitaal_MobileAppDelegate.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/28/10.
//  Copyright GbSi 2010. All rights reserved.
//

#import "Vitaal_MobileAppDelegate.h"
#import "HomeViewController.h"

NSString *kChildrenKey = @"itemChildren";

@implementation Vitaal_MobileAppDelegate

@synthesize window, rootController, homeController, friendData;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window addSubview:rootController.view];
	[window makeKeyAndVisible];
}

- (BOOL)shouldAutoRotateToInterfaceOrientation:(UIInterfaceOrientation)interface {
	return YES;
}


- (void)dealloc {
	[homeController release];
	[rootController release];
    [window release];
    [super dealloc];
}

- (id) init {
	self = [super init];
	if (self)
	{
		NSString *path = [[NSBundle mainBundle] bundlePath];
		NSString *finalPath = [path stringByAppendingPathComponent:@"friends.plist"];
		friendData = [[NSDictionary dictionaryWithContentsOfFile:finalPath] retain];
		NSLog(@"outline path: %@", finalPath);
	}
	return self;
}


@end
