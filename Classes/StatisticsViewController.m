//
//  StatisticsViewController.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/29/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "StatisticsViewController.h"
#import "Vitaal_MobileAppDelegate.h"
#import "MyTabBarController.h"


@implementation StatisticsViewController

@synthesize  portraitView, landscapeView, statisticsTable, headerCell, statisticsImageView, listContents, statusField;

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
	//statisticsTable.rowHeight = 70;
	
	NSArray *array = [[NSArray alloc] initWithObjects:@"Brian's Run", @"Devil's Hop", @"Chris' Climb", @"Brooke's Basher!", @"Kevin's Killer", nil];
	self.listContents = array;
	[array release];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	if ((fromInterfaceOrientation == UIInterfaceOrientationPortrait)) {
		NSLog(@"Rotate me!");
		[self.view addSubview:landscapeView];
		[landscapeView setHidden:NO];
		return;
	}
	if ((fromInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || fromInterfaceOrientation == UIInterfaceOrientationLandscapeRight)) {
		[landscapeView removeFromSuperview];
		[self.view setHidden:NO];
	}
}
/*
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
		[self.view insertSubview:landscapeView aboveSubview:self.view];
	} else {
		[landscapeView removeFromSuperview];
	}
}*/

#pragma mark UITableView delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{	
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0) {
		return 1;
	} else {
		[listContents count];
	}
  return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return @"This is you!";
	} else {
		return @"Recent Runs";
	}
}

- (CGFloat)tableView:(UITableView *)tv heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		return 70.0f;
	} else {
		return 40.0f;
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[statusField resignFirstResponder];
	return NO;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0) {
		UIImage *cellPic = [[UIImage imageNamed:@"avatar1.png"] retain];
		statisticsImageView = [[UIImageView alloc] initWithImage:cellPic];
		
		return headerCell;
		statisticsTable.rowHeight = 70;

	} else {
		static NSString *CellIdentifier = @"Cell";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
		
		// Set up the cell...
		NSUInteger row = [indexPath row];
		cell.text = [self.listContents objectAtIndex:row];
		
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


- (void)dealloc {
    [super dealloc];
	[headerCell release];
	[statisticsTable release];
	[statisticsImageView release];
}


@end
