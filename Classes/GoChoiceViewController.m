//
//  GoChoiceViewController.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 2/17/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "GoChoiceViewController.h"
#import "GoViewController.h"
#import "ExistingCourseSearchController.h"


@implementation GoChoiceViewController

@synthesize newCourse, existingCourse, goViewController, eCSController, myTableView, listContents, cell1, cell0;

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
	myTableView.rowHeight = 60;
	
	NSArray *array = [[NSArray alloc] initWithObjects:@"New Course", @"Existing Course", @"Search Course", nil];
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
	return [listContents count] - 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
	if (section == 0) {
		return @"Please Choose";
	}
	return @"Error Parsing";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section 
{
 return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == 0) {
		if (self.goViewController == nil) {
			GoViewController *aGoViewController = [[GoViewController alloc] initWithNibName:@"GoView" bundle:nil];
			self.goViewController = aGoViewController;
			[aGoViewController release];
		}
	} else if (indexPath.row == 1) {
		if (self.eCSController == nil) {
			ExistingCourseSearchController *aECSController = [[ExistingCourseSearchController alloc] initWithNibName:@"ExistingCourseSearch"
																											  bundle:nil];
			self.eCSController = aECSController;
			[aECSController release];
		}
	}

	
	NSUInteger row = [indexPath row];
	goViewController.title = [NSString stringWithFormat:@"%@", [listContents objectAtIndex:row]];
	eCSController.title = @"Search";
	
	if (indexPath.row == 0) {
		[self.navigationController pushViewController:goViewController animated:YES];
	} else {
		[self.navigationController pushViewController:eCSController animated:YES];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
