//
//  FriendsViewController.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/29/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "FriendsViewController.h"
#import "CustomFriendCell.h"
#import "Vitaal_MobileAppDelegate.h"

NSString *kItemFullNameKey = @"fullName";
NSString *kItemProfilePictureKey = @"profilePicture";
NSString *kItemCurrentStatusKey = @"currentStatus";

@implementation FriendsViewController

@synthesize friendsTable, friendInfo, friendData;

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
	friendsTable.rowHeight = 78;

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
	return 7;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CustomFriendCell";
	
	CustomFriendCell *cell = (CustomFriendCell *)
	[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomFriendCell"
																 owner:nil 
															   options:nil];
		
		for (id currentObject in topLevelObjects) {
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell = (CustomFriendCell *) currentObject;
			}
		}
	}
	
	NSString *path = [[NSBundle mainBundle] bundlePath];
	NSString *finalPath = [path stringByAppendingPathComponent:@"friends.plist"];
	friendData = [[NSDictionary dictionaryWithContentsOfFile:finalPath] retain];
	NSLog(@"outline path: %@", finalPath);
	NSLog(@"%@", [[friendData objectForKey:@"Item 0"] objectForKey:@"fullName"]);
	
	friendInfo = [friendData objectForKey:@"Item 0"];
	NSString *itemNumber = [[NSString alloc] initWithFormat:@"Item %i", indexPath.row];
	
	cell.fullName.text = [[friendData objectForKey:itemNumber] objectForKey:kItemFullNameKey];
	cell.currentStatus.text = [[friendData objectForKey:itemNumber] objectForKey:kItemCurrentStatusKey];
	
	NSString *imagePath = [[NSString alloc] initWithFormat:@"%@", [[friendData objectForKey:itemNumber] objectForKey:kItemProfilePictureKey]];
	
	UIImage *cellPic = [[UIImage imageNamed:imagePath] retain];
	cell.profilePicture = [[UIImageView alloc] initWithImage:cellPic];
	cell.profilePicture.frame = CGRectMake(230, 10, 58, 58);
	[cell addSubview:cell.profilePicture];
	
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
	[friendData release];
	[friendInfo release];
	[friendsTable release];
}


@end
