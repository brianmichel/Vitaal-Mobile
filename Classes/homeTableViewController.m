//
//  homeTableViewController.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/28/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "HomeTableViewController.h"
#import "FriendsViewController.h"
#import "StatisticsViewController.h"
#import "AroundMeViewController.h"
#import "GoViewController.h"
#import "GoChoiceViewController.h"
#import "CustomHomeCell.h"


@implementation HomeTableViewController

@synthesize HomeTableView;
@synthesize tableArray;
@synthesize friendsVC;
@synthesize statisticsViewController;
@synthesize aroundMeViewController;
@synthesize goViewController;
@synthesize goChoiceViewController;
@synthesize mainScreenData;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
	HomeTableView.rowHeight = 93;
	
	self.title = NSLocalizedString(@"Vitaal Mobile", @"Your Mobile Companion");
	
	NSMutableArray *array = [[NSArray alloc] initWithObjects:@"GO!", @"Statistics", @"Around Me", @"Friends", nil];
	
	self.tableArray = array;
	
	[array release];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
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


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"CustomHomeCell";
	
	CustomHomeCell *cell = (CustomHomeCell *)
		[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomHomeCell"
									owner:nil 
									options:nil];
		
		for (id currentObject in topLevelObjects) {
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell = (CustomHomeCell *) currentObject;
			}
		}
	}
	NSString *path = [[NSBundle mainBundle] bundlePath];
	NSString *finalPath = [path stringByAppendingPathComponent:@"mainScreen.plist"];
	mainScreenData = [[NSDictionary dictionaryWithContentsOfFile:finalPath] retain];

	NSString *itemNumber = [[NSString alloc] initWithFormat:@"Item %i", indexPath.row];
	NSString *imagePath = [[NSString alloc] initWithFormat:@"%@", [[mainScreenData objectForKey:itemNumber] objectForKey:@"actionImage"]];

	UIImage *cellPic = [[UIImage imageNamed:imagePath] retain];
	
	cell.actionName.text = [[mainScreenData objectForKey:itemNumber] objectForKey:@"actionName"];
	cell.lastUpdate.text = [[mainScreenData objectForKey:itemNumber] objectForKey:@"lastUpdate"];
	cell.actionImage = [[UIImageView alloc] initWithImage:cellPic];
	cell.actionImage.frame = CGRectMake(10, 5, 78, 78);
	[cell addSubview:cell.actionImage];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	NSString *friendsString = [NSString stringWithString:@"Friends"];
	NSString *goString = [NSString stringWithString:@"GO!"];
	NSString *statString = [NSString stringWithString:@"Statistics"];
	NSString *amString = [NSString stringWithString:@"Around Me"];
	
	NSInteger row = [indexPath row];
	if (self.friendsVC == nil) {
		FriendsViewController *aFriendViewController = [[FriendsViewController alloc] initWithNibName:@"FriendsView" bundle:nil];
		self.friendsVC = aFriendViewController;
		[aFriendViewController release];
	}
	friendsVC.title = [NSString stringWithFormat:@"%@", [tableArray objectAtIndex:row]];
	NSLog(@"%@", [tableArray objectAtIndex:row]);
	
	if ([tableArray objectAtIndex:row] == friendsString ) {
		[self.navigationController pushViewController:friendsVC animated:YES];
	}
	
	if (self.statisticsViewController == nil) {
		StatisticsViewController *aStatisticsViewController = [[StatisticsViewController alloc] initWithNibName:@"StatisticsView" bundle:nil];
		self.statisticsViewController = aStatisticsViewController;
		[aStatisticsViewController release];
	}
	statisticsViewController.title = [NSString stringWithFormat:@"%@", [tableArray objectAtIndex:row]];
	
	if ([tableArray objectAtIndex:row] == statString ) {
		[self.navigationController pushViewController:statisticsViewController animated:YES];
	}
	
	if (self.aroundMeViewController == nil) {
		AroundMeViewController *anAroundMeViewController = [[AroundMeViewController alloc] initWithNibName:@"AroundMeView" bundle:nil];
		self.aroundMeViewController = anAroundMeViewController;
		[anAroundMeViewController release];
	}
	aroundMeViewController.title = [NSString stringWithFormat:@"%@", [tableArray objectAtIndex:row]];
	
	if ([tableArray objectAtIndex:row] == amString ) {
		[self.navigationController pushViewController:aroundMeViewController animated:YES];
	}
	
	if (self.goChoiceViewController == nil) {
		GoChoiceViewController *aGoChoiceViewController = [[GoChoiceViewController alloc] initWithNibName:@"GoChoiceView" bundle:nil];
		self.goChoiceViewController = aGoChoiceViewController;
		[aGoChoiceViewController release];
	}
	goChoiceViewController.title = [NSString stringWithFormat:@"%@", [tableArray objectAtIndex:row]];
	
	if ([tableArray objectAtIndex:row] == goString ) {
		[self.navigationController pushViewController:goChoiceViewController animated:YES];
	}

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

