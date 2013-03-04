//
//  AboutViewController.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/28/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "SettingsViewController.h"
#import "LoadingViewController.h"


@implementation SettingsViewController


@synthesize loginButton, usernameField, usernameCell, loadingView, tableHolderView, passwordField, passwordCell, activity, listContents, settingsTable, loginCell, loadingViewController;

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	settingsTable.rowHeight = 60;
	NSArray *array = [[NSArray alloc ] initWithObjects:@"Username", @"Password", @"Login", nil];
	self.listContents = array;
	
	[array release];	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
#pragma mark UITableView delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{	
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [listContents count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return @"Login Information";
	} else {
		return @"Choose Again";
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	if (section == 0) {
		return @"Device ID: 1018-1920-101-1B";
	} else {
		return @"PI = 2";
	}
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([passwordCell isFirstResponder]) {
		[passwordCell resignFirstResponder];
		[usernameCell resignFirstResponder];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			return usernameCell;
		} else if (indexPath.row == 1) {
			return passwordCell;
		} else {
			return loginCell;
		}

	} else {
		static NSString *CellIdentifier = @"Cell";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
		
		// Set up the cell...
		NSUInteger row = [indexPath row];
		cell.text = [listContents objectAtIndex:row];
		
		return cell;
	}
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
- (IBAction)hideKeyboard:(id)sender {
	[usernameField resignFirstResponder];
	[passwordField resignFirstResponder];
}
- (IBAction)progressFake:(id)sender {

	UIApplication *app = [UIApplication sharedApplication];
	
	[settingsTable insertSubview:loadingView aboveSubview:loadingView];
	app.networkActivityIndicatorVisible = YES;
	[activity startAnimating];
	
	//Use this code to generate trigger to stop progress
	/*NSDate *dateToFire = [[NSDate alloc] initWithTimeInterval:5.0 sinceDate:[NSDate date]];
	[[timer initWithFireDate:dateToFire interval:0.00 target:self selector:@selector(endProgressFake:) userInfo:nil repeats:NO] retain];
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
	sleep(5);*/
	
	//[activity stopAnimating];
	//app.networkActivityIndicatorVisible = NO;
	//[loadingView removeFromSuperview];

	//[dateToFire release];
	//[self endProgressFake];
}

- (IBAction)stopProgress:(id)sender {
	
	UIApplication *app = [UIApplication sharedApplication];

	[activity stopAnimating];
	app.networkActivityIndicatorVisible = NO;
	[loadingView removeFromSuperview];
}

- (void)endProgressFake {
	sleep(4);
	UIApplication *app = [UIApplication sharedApplication];
	
	[activity stopAnimating];
	app.networkActivityIndicatorVisible = NO;
	[loadingView removeFromSuperview];
	
}

- (void)dealloc {
	[loginButton release];
	[loginCell release];
	[passwordField release];
	[passwordCell release];
	[usernameField release];
	[usernameCell release];
	[settingsTable release];
	[activity release];
    [super dealloc];
}


@end
