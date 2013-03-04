//
//  GoViewController.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/29/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "GoViewController.h"
#import "NewCourseModalViewController.h"

@implementation GoViewController

@synthesize stopButton, timerText, timer, startButton, newCourseMVC;

- (IBAction)startTimer:(id)sender {
	timer = [[NSTimer timerWithTimeInterval:1.00 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES] retain];
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (IBAction)isStopped:(id)sender {
	[timer invalidate];
}

- (IBAction)pushModalView:(id)sender {
	if (self.newCourseMVC == nil) {
		NewCourseModalViewController *aNewCourseMVC = [[NewCourseModalViewController alloc] initWithNibName:@"NewCourseModalView" bundle:nil];
		self.newCourseMVC = aNewCourseMVC;
		[aNewCourseMVC release];
	}
	
	UINavigationController *navigationController = [[UINavigationController alloc]
													initWithRootViewController:newCourseMVC];
	
	newCourseMVC.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
																							target:self action:@selector(closeModalView:)] autorelease];
	newCourseMVC.title = @"Course Data";
	
	[self presentModalViewController:navigationController animated:YES];
	
	[navigationController release];
}

- (IBAction)closeModalView:(id)sender {
	[newCourseMVC dismissModalViewControllerAnimated:YES];
}
- (void)timerFired:(NSTimer *)myTimer {
	
	NSDate *currentDate = [NSDate date];
	NSDateFormatter *formatted = [[NSDateFormatter alloc] init];
	NSTimeInterval interval = [currentDate timeIntervalSinceNow];
	NSDate *runDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:currentDate];
	
	[formatted setDateFormat:@"HH:mm:ss"];
	NSString *runTime = [formatted stringFromDate:runDate];
	
	NSString *intervalString = [NSString stringWithFormat:@"%0.0f", interval];
	[timerText setText:[currentDate description]];

	NSLog(@"%@", [currentDate description]);
	NSLog(@"%@", runTime);
	
	[formatted release];
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
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
    [super dealloc];
}


@end
